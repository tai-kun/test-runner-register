declare namespace NodeJS {
  interface ProcessEnv {
    TEST_RUNNER_FILE?: string
  }
}

declare var testRunner: (typeof import("node:test")) & {
  readonly assert: typeof import("node:assert")
}
