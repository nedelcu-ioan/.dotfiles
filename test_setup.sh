#! /usr/bin/env bash
DOCKER_BUILDKIT=0 docker build -t dotfiles-setup .
docker run -it dotfiles-setup
