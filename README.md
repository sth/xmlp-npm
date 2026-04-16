# Packaging xmlp for npm

This uses `dnt` to package `xmlp` for npm as `@tejp/xmlp`.

## Building and publishing the package

Install `dnt`

    deno add jsr:@deno/dnt

Checkout the `xmlp` repository intp a `xmlp` subdirectory

    git checkout https://github.com/sth/xmlp.git

Prepare the package to be release as a certain version number

    ./build.sh 0.5.2

Publish package

    cd npm
    npm publish
