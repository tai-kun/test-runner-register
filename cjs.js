const ARGV = ["/path/to/node", "/path/to/file"];
const fileIndex = ARGV.indexOf("/path/to/file");

if (fileIndex in process.argv) {
  const { resolve } = require("node:path");
  // const { pathToFileURL } = require("node:url");

  const fileAbsPath = resolve(process.argv[fileIndex]);
  const testRunnerFile = fileAbsPath

  process.env.NODE_ENV = "test";
  process.env.TEST_RUNNER_FILE = testRunnerFile;

  const test = require("node:test");
  const assert = require("node:assert/strict");

  global.testRunner = Object.assign(test, { assert });
}
