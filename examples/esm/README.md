# ESM

## Requirements

Node.js `<18.19.0 || >=20.0.0 <20.6.0`

If you are using Node.js 20.6.0 or later, please [see](../v20_6_0/README.md) here.

## Examples

### [`@swc-node/register`](https://www.npmjs.com/package/@swc-node/register) register

```bash
node -r test-runner-register \
     --loader @swc-node/register/esm \
     ./main.ts
```

### [`esbuild-register`](https://www.npmjs.com/package/esbuild-register) register

```bash
node -r test-runner-register \
     --loader esbuild-register/loader \
     ./main.ts
```

### [`ts-node`](https://www.npmjs.com/package/ts-node) register

```bash
node -r test-runner-register \
     --loader ts-node/esm \
     ./main.ts
```

### [`ts-node`](https://www.npmjs.com/package/ts-node) executer

**Not Supported**

### [`tsx`](https://www.npmjs.com/package/tsx) executer

```bash
npx tsx -r test-runner-register \
        ./main.ts
```
