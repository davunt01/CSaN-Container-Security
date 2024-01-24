#!/bin/sh

docker run \
  --security-opt seccomp=profile.json \
  ubuntu \
  mkdir test

docker run \
  --security-opt seccomp=unconfined \
  ubuntu \
  sh -c "apt update && apt install -y gdb && gdb echo"