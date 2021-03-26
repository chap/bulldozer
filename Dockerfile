FROM alpine:latest
RUN apk add --no-cache bash

STOPSIGNAL SIGINT

# add the default configuration file
COPY config/bulldozer.example.yml /secrets/bulldozer.yml

# add static files
COPY docker/ca-certificates.crt /etc/ssl/certs/

# add application files
COPY bulldozer /


