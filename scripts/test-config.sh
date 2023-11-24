#!/usr/bin/env bash

rs=0

files=$(jq -r '.files[]' package.json)
exports=$(jq -r '.exports | to_entries | .[] | .value | to_entries | .[] | .value' package.json)

for file in $exports; do
    if ! echo "$files" | grep -q "${file#./}"; then
        echo "Error: $file is not listed in the files field of package.json"
        rs=1
    fi
done

exit $rs
