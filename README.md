# test-runner-register

In-source testing with the [Node.js Test Runner](https://nodejs.org/api/test.html)

## Usage

### Install

```bash
npm i -D \
  test-runner-register \
  @swc-node/register \
  @types/node \
  typescript
```

### CJS

`path/to/script.ts`

```ts
if (
  process.env.NODE_ENV === "test" &&
  process.env.TEST_RUNNER_FILE === __filename
) {
  const {
    test,
    assert,
    describe
  } = testRunner

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

Log:

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

### ESM

`path/to/script.ts`

```ts
if (
  process.env.NODE_ENV === "test" &&
  process.env.TEST_RUNNER_FILE === import.meta.url
) {
  const {
    test,
    assert,
    describe
  } = testRunner

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
     --loader @swc-node/register/esm \
     path/to/script.ts
```

Command diff:

```diff
  node -r test-runner-register \
-      -r @swc-node/register \
  node -r test-runner-register \
+      --loader @swc-node/register/esm \
       path/to/script.ts
```

Log:

```log
(node:32773) ExperimentalWarning: Custom ESM Loaders is an experimental feature and might change at any time
(Use `node --trace-warnings ...` to show where the warning was created)
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
