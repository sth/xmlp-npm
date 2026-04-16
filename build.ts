// Run like this:
//    deno run -A build.ts

import { build, emptyDir } from "@deno/dnt";

if (Deno.args[0] === undefined) {
    console.error("missing argument: package version number\nThe script requires a single argument with the package version number");
    Deno.exit(1);
}

await emptyDir("./npm");

await build({
  entryPoints: ["./xmlp/mod.ts"],
  outDir: "./npm",
  shims: {
    // see JS docs for overview and more options
    deno: true,
  },
  scriptModule: false,
  test: false,
  typeCheck: false,
  package: {
    // package.json properties
    "name": "@tejp/xmlp",
    "version": Deno.args[0],
    "description": "Typescript XML parser (SAX and PullParser)",
    "repository": "https://github.com/sth/xmlp.git",
    "author": "Stephan Hohe <sth.dev@tejp.de>",
    "license": "MIT",
    "main": "esm/mod.js",
  },
  postBuild() {
    // steps to run after building and before running the tests
    Deno.copyFileSync("xmlp/LICENSE", "npm/LICENSE");
    Deno.copyFileSync("xmlp/README.md", "npm/README.md");
  },
});
