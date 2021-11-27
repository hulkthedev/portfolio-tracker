#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")";

if [ -z "$1" ]; then
  echo "Usage: ./app.sh [OPTIONS]"
  echo " ./app.sh start"
  echo " ./app.sh stop"
  exit 1;
fi

cd "${PROJECT_DIR}" || exit

if [ "$1" = "start" ]; then
  echo "Starting App..."
  docker-compose up -d
else
  echo "Stopping App..."
  docker-compose down
fi

RESULT=$?
exit ${RESULT}
