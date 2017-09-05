#!/bin/sh

apk update &&
    apk upgrade &&
    apk update &&
    apk add --no-cache openssl &&
    mkdir certs &&
    apk upgrade &&
    rm -f /var/cache/apk/*