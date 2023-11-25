import { createRequire, register } from "node:module"
import { pathToFileURL } from "node:url"

import "test-runner-register/esm"

const require = createRequire(pathToFileURL("./"))
const findm = name => {
  try {
    require.resolve(name)
    return true
  } catch {
    return false
  }
}

switch (true) {
  case findm("@swc-node/register"):
    register("@swc-node/register/esm", pathToFileURL("./").href)
    break

  case findm("ts-node"):
    register("ts-node/esm", pathToFileURL("./").href)
    break
}
