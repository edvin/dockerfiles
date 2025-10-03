FROM php:8.4-cli
WORKDIR /app

COPY --from=ghcr.io/mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions sockets mbstring pdo_mysql redis grpc protobuf \
  && echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini

COPY --from=spiralscout/roadrunner:2025.1.2 /usr/bin/rr /usr/local/bin/rr

ENTRYPOINT ["rr", "serve"]
