<a name="readme-top"></a>
[![Workflows][actions-shield]][actions-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
<!-- omit in toc -->
# Alpine Ansible Execution Environment

This repository provides an alternative to the official CentOS-based Ansible [Execution Environments](https://docs.ansible.com/automation-controller/latest/html/userguide/execution_environments.html). Being based on Alpine, it aims to be more lightweight and runs with a non-root user by default.

<!-- omit in toc -->
## 📚 Table of Contents

- [ℹ️ About The Project](#ℹ️-about-the-project)
- [✈️ Getting Started](#️-getting-started)
- [📖 Usage](#-usage)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)
- [📬 Contact](#-contact)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ℹ️ About The Project

This project provides container images for Ansible [Execution Environments](https://docs.ansible.com/automation-controller/latest/html/userguide/execution_environments.html) based on [Alpine Linux](https://www.alpinelinux.org/). 

**Advantages compared to the official EEs built using [ansible-builder](https://github.com/ansible/ansible-builder)**:

- non-root user context
- simpler Containerfile
- small Container image
- easy to use without ansible-runner

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ✈️ Getting Started

TBD

## 📖 Usage

TBD

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing

If you have any suggestions for improvements or fixes, feel free to open an [issue](https://github.com/justsomescripts/ansible-ee-alpine/issues) or a [pull request](https://github.com/justsomescripts/ansible-ee-alpine/pulls). Conventional commits are used to generate versions according to semantic versioning.

1. Fork the project
2. Commit your changes (`git commit -m '<prefix> commit message'`)
   - Prefix 'feat<...>:' to commit new features
   - Prefix 'BREAKING CHANGE:' for breaking changes
3. Push to the branch (`git push origin feature/AmazingFeature`)
4. Open a [pull request](https://github.com/justsomescripts/ansible-ee-alpine/pulls)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📜 License

Distributed under the *GNU GENERAL PUBLIC LICENSE*. See [`LICENSE`](LICENSE) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📬 Contact

David Gries - [@dgries](https://www.linkedin.com/in/dgries/) - mail@dgries.de


<br><sup>README based on [othneildrew/Best-README-Template](https://github.com/othneildrew/Best-README-Template/tree/master)</sup>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[actions-shield]: https://img.shields.io/github/actions/workflow/status/justsomescripts/ansible-ee-alpine/container.yml?style=for-the-badge
[actions-url]: https://github.com/justsomescripts/ansible-ee-alpine/actions/workflows/container.yml
[contributors-shield]: https://img.shields.io/github/contributors/justsomescripts/ansible-ee-alpine.svg?style=for-the-badge
[contributors-url]: https://github.com/justsomescripts/ansible-ee-alpine/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/justsomescripts/ansible-ee-alpine.svg?style=for-the-badge
[forks-url]: https://github.com/justsomescripts/ansible-ee-alpine/network/members
[stars-shield]: https://img.shields.io/github/stars/justsomescripts/ansible-ee-alpine.svg?style=for-the-badge
[stars-url]: https://github.com/justsomescripts/ansible-ee-alpine/stargazers
[issues-shield]: https://img.shields.io/github/issues/justsomescripts/ansible-ee-alpine.svg?style=for-the-badge
[issues-url]: https://github.com/justsomescripts/ansible-ee-alpine/issues
[license-shield]: https://img.shields.io/github/license/justsomescripts/ansible-ee-alpine.svg?style=for-the-badge
[license-url]: https://github.com/justsomescripts/ansible-ee-alpine/blob/main/LICENSE
