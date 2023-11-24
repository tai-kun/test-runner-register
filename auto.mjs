import { register } from "node:module"
import { pathToFileURL } from "node:url"

import "test-runner-register/esm"

try {
  register("@swc-node/register/esm", pathToFileURL("./"))
} catch {
  // ignore
}

try {
  register("ts-node/esm", pathToFileURL("./"))
} catch {
  // ignore
}
