const ARGV = ["/path/to/node", "/path/to/file"];
const fileIndex = ARGV.indexOf("/path/to/file");

if (fileIndex in process.argv) {
  const { resolve } = require("node:path");
  const { pathToFileURL } = require("node:url");

  const fileAbsPath = resolve(process.argv[fileIndex]);
  const testRunnerFile = `${pathToFileURL(fileAbsPath)}.mjs`; // Why ".mjs"?: https://github.com/swc-project/swc-node/blob/9f674cd67091192b1fe62befd13cf4b61a6377e5/packages/register/esm.mts#L73

  process.env.NODE_ENV = "test";
  process.env.TEST_RUNNER_FILE = testRunnerFile;

  const test = require("node:test");
  const assert = require("node:assert/strict");

  global.testRunner = Object.assign(test, { assert });
}
else {
  // ignore
}
