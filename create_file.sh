#!/usr/bin/env bash

. ./print.sh

function verify_file_existence() {
    local file_name=${1}
    if [ -f ${file_name} ]
    then
        in_red "Error! File \"${file_name}\" already exist"
        exit 1
    fi
}

function create_file() {
    local file_name=${1}
    in_cyan "Creating File \"${file_name}\"..."
    touch ${file_name}
    in_green "File \"${file_name}\" created successfully"
}

function create_file_if_does_not_exist() {
    if [ -z ${1} ]
    then
        in_yellow "Usage: ./create_file.sh FILE_NAME"
        in_yellow "i.e create_file.sh my_file.txt"
    else
        verify_file_existence ${1}
        create_file ${1}
    fi
}

if [ "${1}" != "--source-only" ]; then
    create_file_if_does_not_exist "${@}"
fi