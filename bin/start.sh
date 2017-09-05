#!/bin/sh

CIDFILE=$(mktemp) &&
    rm -f ${CIDFILE} &&
    docker \
        container \
        create \
        --tty \
        --cidfile ${CIDFILE} \
        --publish 80:80 \
        endlessplanet/registry &&
    docker \
        network \
        connect \
        --alias registry entrypoint_default $(cat ${CIDFILE}) &&
    docker container start --interactive $(cat ${CIDFILE})