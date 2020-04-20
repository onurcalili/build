#!/bin/bash

PWD=$(pwd)

print_usage() {
    echo "Usage: ${0} <image path to strip> <output file name>"
}

if [ "$#" -ne 2 ]; then
    print_usage
    exit 0
fi

if [ -f "${1}" ]; then
    echo "${1} exist"
    dd if="${1}" of="${PWD}/${2}" bs=512 skip=8192 status=progress
else 
    echo "${1} does not exist"
    print_usage
fi
