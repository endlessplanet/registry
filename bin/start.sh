#!/bin/sh

docker \
    container \
    create \
    --cidfile ${HOME}/docker/containers/registry \
    --publish 5000:5000 \
    --publish 80:80 \
    --env KEY="$(cat ${HOME}/certs/domain.key)" \
    --env CERT="$(cat ${HOME}/certs/domain.crt)" \
    endlessplanet/registry &&
    echo A &&
    docker \
        network \
        connect \
        --alias registry entrypoint_default $(cat ${CIDFILE}) &&
    echo B &&
    docker container --detach start $(cat ${CIDFILE}) &&
    echo C
