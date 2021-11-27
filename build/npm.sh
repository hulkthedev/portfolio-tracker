#!/usr/bin/env bash

set -eo pipefail

IMAGE="portfolio-tracker_node"
TAG="latest"

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")"

docker run --rm -i \
    -v "${PROJECT_DIR}":/app \
    -w="/app" \
    --entrypoint="npm" \
    "${IMAGE}:${TAG}" "$@"

RESULT=$?

exit ${RESULT}
