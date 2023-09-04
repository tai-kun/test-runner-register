#!/usr/bin/env bash

NODE_VERSIONS='16 18 20'

GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'
CLEAR='\033[2K\r'

if [ -n "$CI" ]; then
    GREEN=''
    RED=''
    NC=''
    CLEAR=''
fi

function run() {
    local LOG_FILE

    echo -n "running: $*"

    LOG_FILE="$(mktemp)"
    bash -c "$* >> $LOG_FILE 2> $LOG_FILE"
    rc=$?

    if [ $rc -eq 0 ]; then
        echo -e "$CLEAR${GREEN}success: $* $NC"
    else
        echo -e "$CLEAR${RED}failed: $* $NC"
        echo
        cat "$LOG_FILE"
        echo
    fi

    rm "$LOG_FILE"

    return $rc
}

function run_test() {
    local mod=$1
    local node_version=$2

    if [ -z "$node_version" ]; then
        echo -e "${CLEAR}[$mod] Running tests with default node ${GREEN}$(node --version)${NC}"
    else
        echo -e "${CLEAR}[$mod] Running tests with node version ${GREEN}${node_version}${NC}"

        cp package.json package.json.bak
        volta pin "node@$node_version"
    fi

    run npm ci
    run npm run test:static
    run npm run test:unit

    if [ -z "$node_version" ]; then
        :
    else
        mv package.json.bak package.json
    fi
}

if type volta >/dev/null 2>&1; then
    for mod in cjs esm; do
        for node_version in $NODE_VERSIONS; do
            (cd "examples/$mod" && run_test "$mod" "$node_version")
            echo
        done
    done
else
    for mod in cjs esm; do
        (cd "examples/$mod" && run_test "$mod")
    done
fi
