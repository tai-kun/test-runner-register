#!/usr/bin/env bash

NODE_VERSIONS='16 18 20'

GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

if [ -n "$CI" ]; then
    GREEN=''
    RED=''
    NC=''
fi

function run() {
    local rc
    local LOG_FILE

    echo -n "running: $* ... "

    LOG_FILE="$(mktemp)"
    bash -c "$* >> $LOG_FILE 2> $LOG_FILE"
    rc=$?

    if [ $rc -eq 0 ]; then
        echo -e "${GREEN}success${NC}"
    else
        echo -e "${RED}failed${NC}"
        echo
        cat "$LOG_FILE"
        echo
    fi

    rm "$LOG_FILE"

    return $rc
}

function run_tests() {
    local rs
    local mod=$1
    local node_version=$2

    if [ -z "$node_version" ]; then
        echo -e "[$mod] Running tests with default node ${GREEN}$(node --version)${NC}"
    else
        echo -e "[$mod] Running tests with node version ${GREEN}${node_version}${NC}"

        cp package.json package.json.bak
        volta pin "node@$node_version"
    fi

    rs=0
    run npm ci || rs=1
    run npm run test:static || rs=1
    run npm run test:unit:swc || rs=1
    run npm run test:unit:esbuild || rs=1
    run npm run test:unit:ts-node || rs=1

    if [ -z "$node_version" ]; then
        :
    else
        mv package.json.bak package.json
    fi

    return $rs
}

rs=0

if type volta >/dev/null 2>&1; then
    for mod in cjs esm; do
        for node_version in $NODE_VERSIONS; do
            (cd "examples/$mod" && run_tests "$mod" "$node_version") || rs=1
            echo
        done
    done
else
    for mod in cjs esm; do
        (cd "examples/$mod" && run_tests "$mod") || rs=1
        echo
    done
fi

exit $rs
