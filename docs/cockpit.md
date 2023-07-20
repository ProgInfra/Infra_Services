# Infra Services : Cockpit

![Icon](./img/cockpit.png)

## Table Of Contents

- [Infra Services : Cockpit](#infra-services--cockpit)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Resources](#resources)
  - [Installation](#installation)
  - [Addons](#addons)

## Description

[Cockpit](https://cockpit-project.org/) is a **free** and **Open Source** web based interface for your servers.

## Resources

- [Documentations](https://cockpit-project.org/documentation.html)
- [Installation](https://cockpit-project.org/running.html)
- [Applications Addons](https://cockpit-project.org/applications)

## Installation

To install it you can use this documentation above or like this for Debian for example :

```bash
. /etc/os-release
echo "deb http://deb.debian.org/debian ${VERSION_CODENAME}-backports main" > \
    /etc/apt/sources.list.d/backports.list
apt update
apt install -t ${VERSION_CODENAME}-backports cockpit
```

## Addons

- [Cockpit File Sharing](https://github.com/45Drives/cockpit-file-sharing) : SMB and NFS Share management.
- [Cockpit Tailscale](https://github.com/spotsnel/cockpit-tailscale) : Tailscale VPN management.
- [Cockpit Headscale](https://github.com/spotsnel/cockpit-headscale) : Tailscale VPN Server Management.
