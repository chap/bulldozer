FROM alpine:latest

STOPSIGNAL SIGINT

# add the default configuration file
COPY config/bulldozer.example.yml /secrets/bulldozer.yml

# add static files
COPY docker/ca-certificates.crt /etc/ssl/certs/

# add application files
COPY bulldozer /

ENTRYPOINT ["build/linux-amd64/bulldozer"]
CMD ["server", "--config", "/secrets/bulldozer.yml", "BULLDOZER_PORT", "$PORT"]
