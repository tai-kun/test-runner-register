#!/usr/bin/env bash

if [ ! -f .cache/act ]; then
    mkdir -p .cache
    curl https://github.com/nektos/act/releases/download/v0.2.54/act_Linux_x86_64.tar.gz -L -o .cache/act.tar.gz
    tar xzf .cache/act.tar.gz -C .cache
fi

.cache/act -W .github/workflows/quality.yaml
