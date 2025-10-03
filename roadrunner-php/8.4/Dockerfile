FROM php:8.4-cli
WORKDIR /app

RUN apt-get update && apt-get install -y \
  zlib1g-dev libonig-dev \
  && docker-php-ext-install sockets mbstring pdo_mysql \
  && pecl install grpc protobuf redis \
  && docker-php-ext-enable grpc protobuf redis \
  && rm -rf /var/lib/apt/lists/*

RUN echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory-limit.ini

COPY --from=spiralscout/roadrunner:2025.1.2 /usr/bin/rr /usr/local/bin/rr

CMD ["rr", "serve"]
