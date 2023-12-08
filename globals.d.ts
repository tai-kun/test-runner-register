declare namespace NodeJS {
  interface ProcessEnv {
    TEST_RUNNER_FILE?: string
    TEST_RUNNER_WATCH?: "true"
  }
}

declare var testRunner: {
  readonly [K in keyof typeof import("node:test")]: typeof import("node:test")[K]
} & {
  readonly assert: {
    (value: unknown, message?: string | Error): void
  } & {
    readonly [K in keyof typeof import("node:assert")]: typeof import("node:assert")[K]
  }
}
