#!/bin/bash
set -eu

cd "$(dirname "$0")"


if [[ -v 1 ]]; then
	VERSION="$1"
else
	VERSION="0.0.0"
	if [[ -e .version ]]; then
		read VERSION < .version
	fi

	echo -n "Package version (default $VERSION): "
	read NVERSION

	if [[ -n "$NVERSION" ]]; then
		VERSION="$NVERSION"
	fi
fi

echo "Preparing package version $VERSION"
deno run -A build.ts "$VERSION"

echo 'The package is prepared in `npm/` and can be published there with `npm publish`'

echo "$VERSION" > .version
