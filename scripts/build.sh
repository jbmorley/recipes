#!/bin/bash

set -e
set -o pipefail
set -x
set -u

SCRIPTS_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIRECTORY="${SCRIPTS_DIRECTORY}/.."

INCONTEXT_URL="https://github.com/inseven/incontext-waialua/releases/download/3.0.3/incontext-3.0.3-230825174308596923.zip"

pushd "$ROOT_DIRECTORY"
rm -rf bin
mkdir -p bin
pushd bin
curl -o incontext.zip -L "$INCONTEXT_URL"
unzip incontext.zip
popd

bin/incontext build
