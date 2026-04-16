#!/bin/bash
set -eu

cd "$(dirname "$0")"

echo "Preparing package"
deno run -A build.ts "$@"

echo 'The package is prepared in `npm/` and can be published there with `npm publish`'
