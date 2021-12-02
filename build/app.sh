#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")";

if [ -z "$1" ]; then
  echo "Usage: ./app.sh [OPTIONS]"
  echo " ./app.sh start"
  echo " ./app.sh stop"
  echo " ./app.sh test"
  echo " ./app.sh build"
  exit 1;
fi

cd "${PROJECT_DIR}" || exit

if [ "$1" = "start" ]; then
  echo "@@@ starting app ..."
  docker-compose up -d

elif [ "$1" = "stop" ]; then
  echo "@@@ stopping app ..."
  docker-compose down

elif [ "$1" = "build" ]; then
  echo "@@@ building app ..."
  docker-compose -f docker-compose.yml build

  chmod +x "${BUILD_DIR}"/npm.sh
  "${BUILD_DIR}"/npm.sh install

elif [ "$1" = "test" ]; then
  echo "@@@ testing app ..."
  "${BUILD_DIR}"/npm.sh test

else
  echo "Wrong Argument"
fi

RESULT=$?
exit ${RESULT}
