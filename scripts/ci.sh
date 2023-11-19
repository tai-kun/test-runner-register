#!/usr/bin/env bash

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

    echo -e "[$mod] Running tests with node ${GREEN}$(node --version)${NC}"

    rs=0
    run npm ci || rs=$?
    run npm run test:static || rs=$?
    run npm run test:unit:swc || rs=$?
    run npm run test:unit:esbuild || rs=$?
    run npm run test:unit:ts-node || rs=$?

    return $rs
}

echo "$*"

rs=0

for mod in "$@"; do
    (cd "examples/$mod" && run_tests "$mod") || rs=$?
    echo
done

exit $rs
