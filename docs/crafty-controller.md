# Infra Services : Crafty Controller

![Icon](./img/pterodactyl.png)

## Table Of Contents

- [Infra Services : Crafty Controller](#infra-services--crafty-controller)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Resources](#resources)
  - [Docker Compose](#docker-compose)
  - [Install](#install)
  - [Configure](#configure)
  - [Setup New Minecraft Server](#setup-new-minecraft-server)

## Description

[Crafty Controller](https://craftycontrol.com/) is a **free** and **Open Source** Minecraft Server Management, with it, you can run all **minecraft server** you want and manage them in **beautiful Web UI**.

## Resources

- [Documentations](https://wiki.craftycontrol.com/en/)
- [GitLab Repository](https://gitlab.com/crafty-controller/crafty-4)
- [Script](https://gitlab.com/crafty-controller/crafty-installer-4.0)

## Docker Compose

If you want, you can use a simple Docker Compose file but you haven't full power with it :

```yml
version: '3.6'

services:
  crafty-controller:
    container_name: crafty-controller
    image: registry.gitlab.com/crafty-controller/crafty-4:latest
    environment:
    - TZ=Europe/Paris
    volumes:
    - ./data/backups:/crafty/backups:rw
    - ./data/logs:/crafty/logs:rw
    - ./data/servers:/crafty/servers:rw
    - ./data/config:/crafty/app/config:rw
    - ./data/import:/crafty/import:rw
    ports:
    - "8000:8000" # HTTP
    - "8443:8443" # HTTPS
    - "8123:8123" # DYNMAP
    - "19132:19132/udp" # BEDROCK
    - "25500-25600:25500-25600" # MC SERV PORT RANGE
    restart: always
```

After this you can start you Docker Container :

```bash
# In Classic Mode
docker-compose up

# In Detach Mode
docker-compose up -d
```

## Install

The best way to install Crafty Controller is with the Install Script :

```bash
# Go in Root
sudo -s

# Clone Install Script Repository
git clone https://gitlab.com/crafty-controller/crafty-installer-4.0.git crafty-installer

cd crafty-installer

# Install Crafty Controller
./install_crafty.sh
```

## Configure

Now you have to configure your server :

1) First Connect to your Crafty Controller Web UI with default admin user :
   1) Username : admin
   2) Password : crafty
2) TODO Reconfigure Password
3) TODO Configure Users

## Setup New Minecraft Server

Finally, your server is ready, you can setup your first Minecraft server :

1) TODO
