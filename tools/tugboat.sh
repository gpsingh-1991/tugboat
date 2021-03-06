#!/usr/bin/env bash

set -e

: ${WORKSPACE:=$(pwd)}
: ${IMAGE:=quay.io/att-comdev/tugboat:latest}

echo
echo "== NOTE: Workspace $WORKSPACE is the execution directory in the container =="
echo

# Working directory inside container to execute commands from and mount from
# host OS
container_workspace_path='/var/tugboat'

docker run --rm -t \
    --net=none \
    --workdir="$container_workspace_path" \
    -v "${WORKSPACE}:$container_workspace_path" \
    "${IMAGE}" \
    tugboat "${@}"
