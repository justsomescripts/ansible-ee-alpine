######################################### BUILD #########################################
 
FROM python:alpine3.20@sha256:7788ec80bdacc4736a50adce4c3711581e83650a8895c6dbf202caf4af7a3270 as builder
 
    # Add configuration files
    COPY requirements/apk.build.list requirements/pip.list /requirements/
 
    # Install system build dependencies
    RUN apk add --update --no-cache $(cat /requirements/apk.build.list)
    RUN python -m venv /opt/ansible_venv/ && PATH=/opt/ansible_venv/bin:${PATH} \
        pip install --upgrade --no-cache-dir --requirement requirements/pip.list
 
######################################### RUNNER #########################################
 
FROM python:alpine3.20@sha256:7788ec80bdacc4736a50adce4c3711581e83650a8895c6dbf202caf4af7a3270
 
    # Directory for executing Playbooks
    WORKDIR /runner/
 
    # Add non-root user
    ARG USER=ansible
    ARG GROUP=ansible
    ARG UID=1000
    ARG GID=1000
    RUN addgroup ${GROUP} --gid ${GID} && \
        adduser  ${USER}  --uid ${UID} \
          --ingroup "${GROUP}" \
          --disabled-password && \
        chown ${USER}:${GROUP} /runner/
 
    RUN chmod 777 /runner/ /home/ansible/
 
    # Add requirements
    COPY requirements/apk.list requirements/ansible.yaml /requirements/
 
    RUN apk add --update --no-cache $(cat /requirements/apk.list)
 
    # Copy python environment (Ansible required args and scripts)
    ENV PATH=/opt/ansible_venv/bin:${PATH} \
        ANSIBLE_ROLES_PATH=roles:/runner/roles:/usr/share/ansible/roles \
        ANSIBLE_COLLECTIONS_PATH=collections:/runner/collections:/usr/share/ansible/collections \
        ANSIBLE_LOCAL_TEMP=/tmp \
        ANSIBLE_INVENTORY_PLUGINS=/runner/project/plugins \
        ANSIBLE_SSH_ARGS="-o ControlMaster=auto -o ControlPersist=60s" \
        ANSIBLE_SSH_HOST_KEY_CHECKING=False \
        ANSIBLE_SSH_PIPELINING=True \
        ANSIBLE_HASH_BEHAVIOUR=merge
    COPY --from=builder /opt/ansible_venv/ /opt/ansible_venv/
 
    ARG ANSIBLE_GALAXY_CLI_ROLE_OPTS=
    ARG ANSIBLE_GALAXY_CLI_COLLECTION_OPTS=
    RUN ansible-galaxy role install ${ANSIBLE_GALAXY_CLI_ROLE_OPTS} --role-file /requirements/ansible.yaml \
          --roles-path "/usr/share/ansible/roles" && \
        ANSIBLE_GALAXY_DISABLE_GPG_VERIFY=1 ansible-galaxy collection install ${ANSIBLE_GALAXY_CLI_COLLECTION_OPTS} \
          --requirements-file /requirements/ansible.yaml --collections-path "/usr/share/ansible/collections" && \
        chmod -R a=rX /usr/share/ansible

    ENV HOME=/home/ansible
 
    # Switch to non-root user
    USER ${UID}:${GID}
