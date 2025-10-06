# dockerfiles/justfile

default:
    @just --list

# Build single arch
build image="roadrunner-php" version="8.4":
    docker build -t edvin/{{image}}:{{version}} {{image}}/{{version}}

# Multi-arch build + push
publish image="roadrunner-php" version="8.4":
    docker buildx build \
      --platform linux/amd64,linux/arm64 \
      -t edvin/{{image}}:{{version}} \
      -t edvin/{{image}}:latest \
      {{image}}/{{version}} \
      --push
