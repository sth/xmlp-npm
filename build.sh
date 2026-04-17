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

echo
echo "The package version $VERSION is prepared in npm/ and can be published with:"
echo '    ( cd npm; npm publish )'
echo
echo 'Tag the release in git:'
echo "    git -C xmlp tag 'npm-v$VERSION'"

echo "$VERSION" > .version
