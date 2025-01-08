#!/bin/bash

json_result="{}"

commands=("date" "uname -a" "whoami" "ls -al /")

for cmd in "${commands[@]}"; do
    output=$(eval "$cmd" | tr '\n' ' ')
    json_result=$(echo "$json_result" | jq --arg cmd "$cmd" --arg output "$output" '. + {($cmd): $output}')
done

echo "$json_result"
