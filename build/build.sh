#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")"

echo "__build docker image"
  cd "${PROJECT_DIR}" || exit
  docker-compose -f docker-compose.yml build


echo "__set permissions"
  cd "${BUILD_DIR}" || exit

  executables=(
    "app.sh"
    "npm.sh"
    "test.sh"
  )

  for (( i=0; i<${#executables[@]}; i++ )); do
    chmod +x "${executables[$i]}"
    echo "  > ${executables[$i]}"
  done


echo "__install project dependencies"
  ./npm.sh install


if [ -z "$1" ]; then
  echo "__starting app"
  ./app.sh start
fi

RESULT=$?
exit ${RESULT}