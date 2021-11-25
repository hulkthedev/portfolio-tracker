#!/usr/bin/env bash

set -eo pipefail

IMAGE="node"
TAG="16.13.0-alpine3.14"

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")";

echo "${BUILD_DIR}"
echo "${PROJECT_DIR}"

docker run --rm -i \
    -v "$(pwd)":/app \
    -w="/app" \
    --entrypoint="npm" \
    "${IMAGE}:${TAG}" "$@"

RESULT=$?

exit ${RESULT}
