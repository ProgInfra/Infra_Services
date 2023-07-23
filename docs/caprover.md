# Infra Services : CapRover

![Icon](./img/caprover.png)

## Table Of Contents

- [Infra Services : CapRover](#infra-services--caprover)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Resources](#resources)
  - [Docker](#docker)
  - [Extra Configuration](#extra-configuration)
  - [Upgrade Ideas](#upgrade-ideas)
  - [Traefik](#traefik)

## Description

[CapRover](https://caprover.com/) is a **free** and **Open Source** PaaS, with it, you can manage and use applications.

## Resources

- [Documentations](https://caprover.com/docs/get-started.html)
- [GitHub Repository](https://github.com/caprover/caprover)

## Docker

If you run in local, you can do this :

```bash
mkdir -p /captain/data && chmod 755 -R /captain

echo  "{\"skipVerifyingDomains\":\"true\", \"dockerApiVersion\":\"v1.41\"}" >  /captain/data/config-override.json
```

You can run just one command to start CapRover installation :

```bash
docker run \
  -e MAIN_NODE_IP_ADDRESS=192.168.1.100 \
  -e DEFAULT_PASSWORD=testy \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /captain:/captain \
  -p 80:80 \
  -p 443:443 \
  -p 3000:3000 \
  caprover/caprover
```

## Extra Configuration

1) You need to connect to CapRover with IP and port 3000
2) Next you have to configure you domain, it must be publicly accessible or just use this domain with your IP in local or private environment : 192.168.1.42.sslip.io
3) Now you can use your CapRover instance (in local or private environment, don't setup HTTPS !).

## Upgrade Ideas

- Integrate `Service Update Override` in CapRover Template to setup these for some services.
- First Traefik Implementation :
  - Deploy it with CapRover Template
  - Upgrade each services to add in `Service Update Override` the network and labels config for Traefik
- Final Traefik Implementation : Refactor to replace NGINX by Traefik

## Traefik

If you want, you can setup Traefik as main reverse proxy to manage CapRover and these services :

1) Install [CapRover like above](#docker) and config it with **sslip.io** like this : **192.168.1.100.sslip.io**
2) Create a new **MacVLAN** docker network configuration with the range you want to configure the IP of Traefik with this command :
   1) **Command** : `docker network create --config-only --subnet 192.168.1.0/24 -o parent=enp0sXXX --ip-range 192.168.1.100/31 traefik-macvlan-config-net`
   2) **Parameter** : **subnet** = Your local network, 192.168.1.0/24 here.
   3) **Parameter** : **parent** = Interface to use for internet (`ip a` to display interfaces)
   4) **Parameter** : **ip-range** = IP range to define the IP attributed to Traefik, **192.168.1.100/31** here for **Traefik** at **192.168.1.101**
3) Create the **MacVLAN** docker network attachable to Traefik : `docker network create --driver=macvlan --scope swarm --config-from traefik-macvlan-config-net --attachable traefik-macvlan-swarm-net`
4) Copy files in `src/caprover-traefik` to `/srv/traefik` and go to this folder
5) Deploy Traefik service : `docker stack deploy -c compose.yml traefik`

Now when you deploy a new service with CapRover, you can add in App Configs => Service Update Override some labels to configure with Traefik or just with files like in example, if you want to use labels, you can use this, it's an example for Portainer :

```json
{
  "Labels": {
    "traefik.enable": "true",
    "traefik.http.services.portainer-service.loadbalancer.server.port": "9000",

    "traefik.http.routers.portainer.rule": "Host(`portainer.192.168.1.101.sslip.io`)",
    "traefik.http.routers.portainer.entrypoints": "web",
    "traefik.http.routers.portainer.middlewares": "https-redirect@file",

    "traefik.http.routers.portainer-secure.rule": "Host(`portainer.192.168.1.101.sslip.io`)",
    "traefik.http.routers.portainer-secure.entrypoints": "websecure",
    "traefik.http.routers.portainer-secure.tls": "true",
    "traefik.http.routers.portainer-secure.service": "portainer-service"
  }
}
```
