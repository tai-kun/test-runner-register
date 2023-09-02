#!/usr/bin/env bash

(cd examples/cjs && npm ci && npm run test:static && npm run test:unit)
(cd examples/esm && npm ci && npm run test:static && npm run test:unit)
