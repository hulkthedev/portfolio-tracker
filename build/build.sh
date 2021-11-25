#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")";