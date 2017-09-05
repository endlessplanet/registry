#!/bin/sh

docker stop $(cat ${HOME}/docker/containers/registry) &&
    docker rm --force --volumes $(cat ${HOME}/docker/containers/registry) &&
    rm -f ${HOME}/docker/containers/registry