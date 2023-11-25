# CJS

## Examples

### [`@swc-node/register`](https://www.npmjs.com/package/@swc-node/register) register

```bash
node -r test-runner-register \
     -r @swc-node/register \
     ./main.ts
```

### [`esbuild-register`](https://www.npmjs.com/package/esbuild-register) register

```bash
node -r test-runner-register \
     -r esbuild-register \
     ./main.ts
```

### [`ts-node`](https://www.npmjs.com/package/ts-node) register

```bash
node -r test-runner-register \
     -r ts-node/register \
     ./main.ts
```

### [`ts-node`](https://www.npmjs.com/package/ts-node) executer

**Not Supported**

### [`tsx`](https://www.npmjs.com/package/tsx) executer

```bash
npx tsx -r test-runner-register \
        ./main.ts
```
