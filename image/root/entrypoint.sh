#!/bin/sh

if [ ! -d /var/opt/docker ]
then
    mkdir /var/opt/docker
fi &&
    if [ ! -d /var/opt/docker/certs ]
    then
        mkdir /var/opt/docker/certs
    fi &&
    if [ ! -f /var/opt/docker/certs/registry.key ]
    then
        echo ${KEY} > /var/opt/docker/certs/registry.key &&
            chmod 0644 /var/opt/docker/certs/registry.key
    fi &&
    if  [ ! -f /var/opt/docker/certs/registry.crt ]
    then
        echo ${CERT} > /var/opt/docker/certs/registry.crt &&
            chmod 0644 /var/opt/docker/certs/registry.crt
    fi &&
    /entrypoint.sh "${@}"