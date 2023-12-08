const { pathToFileURL } = require("node:url");

require("./register.cjs").register({
  getFilePath: pathToFileURL
});
