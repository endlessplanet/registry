#!/bin/sh

docker \
    container \
    create \
    --cidfile ${HOME}/docker/containers/registry \
    --publish 5000:5000 \
    --publish 80:80 \
    --env KEY="$(cat ${HOME}/certs/domain.key)" \
    --env CERT="$(cat ${HOME}/certs/domain.crt)" \
    --entrypoint bash \
    --tty \
    endlessplanet/registry &&
    docker \
        network \
        connect \
        --alias registry \
        $(cat ${HOME}/docker/networks/default) \
        $(cat ${HOME}/docker/containers/registry) &&
    docker container start --interactive $(cat ${HOME}/docker/containers/registry)
 