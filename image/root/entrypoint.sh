#!/bin/sh

if [ ! -d /var/opt/docker ]
then
    mkdir /var/opt/docker
fi &&
    if [ ! -d /var/opt/docker/certs ]
    then
        mkdir /var/opt/docker/certs
    fi &&
    if [ ! -f /var/opt/docker/certs/registry.key ] || [ ! -f /var/opt/docker/certs/registry.crt ]
    then
        openssl req -x509 -newkey rsa:4096 -keyout /var/opt/docker/certs/registry.key -out /var/opt/docker/certs/registry.crt -days 365 -nodes <<EOF
US
Virginia
Arlington
Endless Planet
Heavy Industries
registry




EOF
    fi &&
    /entrypoint.sh "${@}"