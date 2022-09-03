#!/bin/bash


# Git Setup Multiple Repository
git remote add gitlab git@gitlab.com:proginfra/infra_services.git
git remote set-url --add --push origin git@gitlab.com:proginfra/infra_services.git

git remote add github git@github.com:ProgInfra/Infra_Services.git
git remote set-url --add --push origin git@github.com:ProgInfra/Infra_Services.git


# Display Config
git remote show origin

git config --list
