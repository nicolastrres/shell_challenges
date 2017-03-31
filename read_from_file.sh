#!/usr/bin/env bash

# Read a file. If the first parameter is a file then print its content otherwise read a default file. default_file.txt

. ./print.sh


function read_file() {
    if [ -z ${1} ]
    then
        in_yellow "Usage: ./read_file.sh FILE_NAME"
        in_yellow "If the first argument is a file then it will print its content otherwise it will print the content of default_file.txt"
    else
        if [ -f ${1} ];then
            cat ${1}
        else
            cat default_file.txt
        fi
    fi
}

if [ "${1}" != "--source-only" ]; then
    read_file "${@}"
fi