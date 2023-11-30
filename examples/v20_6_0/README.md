# ESM

## Requirements

Node.js `>=20.6.0`

If you are using Node.js earlier than 20.6.0, please [see](../esm/README.md) here.

If you are using CommonJS, please [see](../cjs/README.md) here.

## Example

### [`@swc-node/register`](https://www.npmjs.com/package/@swc-node/register) register

```bash
node --import test-runner-register/import \
     ./main.ts
```

### [`esbuild-register`](https://www.npmjs.com/package/esbuild-register) register

**Not Supported**

Issue: https://github.com/egoist/esbuild-register/issues/96

### [`ts-node`](https://www.npmjs.com/package/ts-node) register

```bash
node --import test-runner-register/import/ts-node \
     ./main.ts
```

### [`ts-node`](https://www.npmjs.com/package/ts-node) executer

**Not Supported**

### [`tsx`](https://www.npmjs.com/package/tsx) executer

```bash
npx tsx -r test-runner-register \
        ./main.ts
```
