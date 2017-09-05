FROM registry:2.6.2
COPY root /opt/docker/
RUN ["sh", "/opt/docker/run.sh"]
ENV \
    REGISTRY_HTTP_ADDR=0.0.0.0:80 \
    REGISTRY_HTTP_TLS_CERTIFICATE="/var/opt/docker/certs/registry.crt" \
    REGISTRY_HTTP_TLS_KEY="/var/opt/docker/certs/registry.key"
ENTRYPOINT ["sh", "/opt/docker/entrypoint.sh"]
CMD ["/etc/docker/registry/config.yml"]