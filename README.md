# test-runner-register

In-source testing with the [Node.js Test Runner](https://nodejs.org/api/test.html)

[![npm latest package](https://img.shields.io/npm/v/test-runner-register/latest.svg)](https://www.npmjs.com/package/test-runner-register)
[![Quality](https://github.com/tai-kun/test-runner-register/actions/workflows/quality.yaml/badge.svg)](https://github.com/tai-kun/test-runner-register/actions/workflows/quality.yaml)

- [Install](#install)
- [CJS](#cjs)
- [ESM](#esm)
- [TypeScript](#typescript)
- [More examples](#more-examples)

## Install

```bash
npm i -D \
  test-runner-register \
  @swc-node/register \
  @types/node \
  typescript
```

## CJS

path/to/script.ts:

```ts
const assert = require("node:assert/strict")
const { test, describe } = require("node:test")

if (
  process.env.NODE_ENV === "test" &&
  process.env.TEST_RUNNER_FILE === __filename
) {
  // You can also use `testRunner` instead of "node:*" modules.
  // const { test, assert, describe } = testRunner

  describe("...", () => {
    test("...", () => {
      assert(true)
    })
  })
}
```

Run:

```bash
node -r test-runner-register \
     -r @swc-node/register \
     path/to/script.ts
```

<details>
  <summary>Log:</summary>

  ```log
  ▶ ...
    ✔ ... (0.195722ms)
  ▶ ... (0.838251ms)

  ℹ tests 1
  ℹ suites 1
  ℹ pass 1
  ℹ fail 0
  ℹ cancelled 0
  ℹ skipped 0
  ℹ todo 0
  ℹ duration_ms 0.066372
  ```
</details>

## ESM

package.json:

```json
{
  "type": "module"
}
```

path/to/script.ts:

```ts
import assert from "node:assert/strict"
import { test, describe } from "node:test"

if (
  process.env.NODE_ENV === "test" &&
  process.env.TEST_RUNNER_FILE === import.meta.url
) {
  // You can also use `testRunner` instead of "node:*" modules.
  // const { test, assert, describe } = testRunner

  describe("...", () => {
    test("...", () => {
      assert(true)
    })
  })
}
```

Run (Node.js < 20.6.0):

```bash
node -r test-runner-register \
     --loader @swc-node/register/esm \
     ./main.ts
```

Run (Node.js >= 20.6.0):

```bash
node --import test-runner-register/import \
     ./main.ts
```

<details>
  <summary>Log:</summary>

  ```log
  ▶ ...
    ✔ ... (0.153848ms)
  ▶ ... (0.78856ms)

  ℹ tests 1
  ℹ suites 1
  ℹ pass 1
  ℹ fail 0
  ℹ cancelled 0
  ℹ skipped 0
  ℹ todo 0
  ℹ duration_ms 0.062858
  ```
</details>

## TypeScript

`test-runner-register` exports `testRunner` global variable:

```js
const test = require("node:test");
const assert = require("node:assert/strict");

global.testRunner = Object.assign(test, { assert });
```

env.d.ts:

```ts
/// <reference types="test-runner-register/globals" />
```

tsconfig.json:

```json
{
  "files": [
    "./env.d.ts"
  ]
}
```

path/to/script.ts:

```ts
// import assert from "node:assert/strict"
// import { test, describe } from "node:test"

if (
  process.env.NODE_ENV === "test" &&
  process.env.TEST_RUNNER_FILE === import.meta.url
) {
  // 🎉 You can also use `testRunner` instead of "node:*" modules.
  const { test, assert, describe } = testRunner

  describe("...", () => {
    test("...", () => {
      assert(true)
    })
  })
}
```

## More examples

- [CJS](./examples/cjs/README.md)
- ESM
  - [Node.js < 20.6.0](./examples/esm/README.md)
  - [Node.js >= 20.6.0](./examples/v20_6_0/README.md)
