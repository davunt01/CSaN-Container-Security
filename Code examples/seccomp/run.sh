#!/bin/sh

docker run \
  --security-opt seccomp=profile.json \
  --name with_seccomp \
  --rm \
  ubuntu \
  mkdir test

docker run \
  --security-opt seccomp=unconfined \
  --name unconfined \
  --rm \
  ubuntu \
  sh -c "apt update && apt install -y gdb && gdb echo"

