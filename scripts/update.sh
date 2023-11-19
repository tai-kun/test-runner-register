#!/usr/bin/env bash

(cd examples/cjs && npx npm-check-updates --upgrade --reject @types/node)
(cd examples/esm && npx npm-check-updates --upgrade --reject @types/node)
(cd examples/v20_6_0 && npx npm-check-updates --upgrade --reject @types/node)
