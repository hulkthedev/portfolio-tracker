#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "${BUILD_DIR}" || exit
./npm.sh test

RESULT=$?
exit ${RESULT}