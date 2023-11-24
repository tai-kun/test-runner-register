import { register } from "node:module"
import { pathToFileURL } from "node:url"

import "test-runner-register/esm"

register("ts-node/esm", pathToFileURL("./"))
