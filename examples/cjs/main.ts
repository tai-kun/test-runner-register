export function add(a: number, b: number): number {
  return a + b
}

if (process.env.NODE_ENV === "test" && process.env.TEST_RUNNER_FILE === __filename) {
  const {
    test,
    assert,
    describe
  } = testRunner

  describe("add", () => {
    test("should add two numbers", () => {
      assert.equal(add(1, 2), 3)
    })
  })
}
