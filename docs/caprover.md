# Infra Services : CapRover

![Icon](./img/caprover.png)

## Table Of Contents

- [Infra Services : CapRover](#infra-services--caprover)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Resources](#resources)
  - [Docker](#docker)
  - [Extra Configuration](#extra-configuration)

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
