# Infra Services

![Icon](./icon.png)

[Software development icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/software-development)

## Table Of Contents

- [Infra Services](#infra-services)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Access](#access)
  - [Services Available](#services-available)
  - [Changelog](#changelog)
  - [Documentations](#documentations)
  - [Development](#development)
    - [Requirements](#requirements)
    - [Docsify](#docsify)
  - [Contributing](#contributing)
  - [Licence](#licence)

## Description

Infrastructure Services Installation and Configuration.

TODO

## Access

- **Development (Local)** :
  - [Infra Services Docs Development](http://localhost:6007)
- **Production (Local)** :
  - [Infra Services Docs Production](http://localhost:6007)
- **Production** :
  - [Infra Services Docs Production](https://proginfra.gitlab.io/infra_services)

## Services Available

TODO

## Changelog

See [CHANGELOG](./CHANGELOG.md) for more information.

## Documentations

- [Ideas](./docs/ideas.md)

## Development

If you want you can **develop** this repository :

1) You need to install the [Requirements](#requirements)
2) You can develop on [Docsify](#docsify)

### Requirements

We use **Docker** :

- Docker
- Docker Compose

### Docsify

```bash
cd docsify

# Development
docker-compose -f docker-compose.dev.yml up

# Production
docker-compose up --build
```

## Contributing

See [CONTRIBUTING](./CONTRIBUTING.md) for more information.

## Licence

This project is licensed under the terms of the MIT license.

See [LICENSE](./LICENCE) for more information.
