FROM php:8.4-cli
WORKDIR /app

RUN apt-get update && apt-get install -y \
  zlib1g-dev libonig-dev libbrotli-dev \
  && docker-php-ext-install sockets mbstring pdo_mysql \
  && pecl install grpc protobuf redis brotli \
  && docker-php-ext-enable grpc protobuf redis brotli \
  && rm -rf /var/lib/apt/lists/* \
  && echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini

COPY --from=spiralscout/roadrunner:2025.1.4 /usr/bin/rr /usr/local/bin/rr

ENV WWWUSER=1000 \
    WWWGROUP=1000

ENTRYPOINT ["rr", "serve"]
