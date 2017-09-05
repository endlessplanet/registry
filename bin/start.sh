#!/bin/sh

CIDFILE=$(mktemp) &&
    rm -f ${CIDFILE} &&
    docker \
        container \
        create \
        --cidfile ${CIDFILE} \
        --publish 5000:5000 \
        endlessplanet/registry &&
    docker \
        network \
        connect \
        --alias registry entrypoint_default $(cat ${CIDFILE}) &&
    docker container start $(cat ${CIDFILE}) &&
    read -p "HIT ENTER TO QUIT:  " QUIT &&
    docker container stop $(cat ${CIDFILE}) &&
    docker container rm --force --volumes $(cat ${CIDFILE})