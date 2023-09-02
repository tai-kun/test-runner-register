const { resolve } = require("node:path");
const test = require("node:test");
const assert = require("node:assert/strict");

const ARGV = ["/path/to/node", "/path/to/file"];
const fileIndex = ARGV.indexOf("/path/to/file");
const fileAbsPath = resolve(process.argv[fileIndex]);
const testRunnerFile = fileAbsPath;

process.env.NODE_ENV = "test";
process.env.TEST_RUNNER_FILE = testRunnerFile;

global.testRunner = Object.assign(test, { assert });
