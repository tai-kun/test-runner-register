const { resolve } = require("node:path");

const ARGV = ["/path/to/node", "/path/to/file"];
const fileIndex = ARGV.indexOf("/path/to/file");

/**
 * @param {object} [setup] 
 * @param {string[]} [setup.argv]
 * @param {string[]} [setup.execArgv]
 * @param {(abs: string) => string} [setup.getFilePath]
 */
exports.register = function register(setup) {
  setup = setup || {};
  setup.argv = setup.argv || process.argv;
  setup.execArgv = setup.execArgv || process.execArgv;
  setup.getFilePath = setup.getFilePath || (x => x);

  if (!(fileIndex in setup.argv)) {
    return;
  }

  if (/,--test[,=]/.test(`,${setup.execArgv},`)) {
    process.env.NODE_ENV = "test";
    process.env.TEST_RUNNER_FILE =
      setup.getFilePath(resolve(setup.argv[fileIndex]));

    if (/,--watch,/.test(`,${setup.execArgv},`)) {
      process.env.TEST_RUNNER_WATCH = "true";
    }
  } else {
    try {
      const test = require("node:test");
      const assert = require("node:assert/strict");

      global.testRunner = Object.assign(test, { assert });
    } catch (_) {
      console.warn(
        "The `node:test` module is not supported in this environment." +
        "So, the `testRunner` global variable is not available."
      );
    }
  }
};
