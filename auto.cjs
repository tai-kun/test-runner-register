const { cwd } = require("node:process");
const { join } = require("node:path");
const { readFileSync } = require("node:fs");

const pkgJsonPath = join(cwd(), "package.json");
const pkgJson = readFileSync(pkgJsonPath, "utf8");
const pkg = JSON.parse(pkgJson);

if (pkg.type === "module") {
  require("./esm.cjs");
}
else {
  require("./cjs.js");
}
