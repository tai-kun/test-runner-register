#!/usr/bin/env bash

(cd examples/cjs && npx npm-check-updates --upgrade --reject @types/node && npm i)
(cd examples/esm && npx npm-check-updates --upgrade --reject @types/node && npm i)
