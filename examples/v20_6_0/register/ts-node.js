import { register } from "node:module"
import { pathToFileURL } from "node:url"

import "test-runner-register"

register("ts-node/esm", pathToFileURL("./"))
