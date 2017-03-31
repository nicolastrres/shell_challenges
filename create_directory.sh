#!/usr/bin/env bash

. ./print.sh

function verify_directory_existence() {
    local dir_name=${1}
    if [ -d ${dir_name} ]
    then
        in_red "Error! Directory \"${dir_name}\" already exist"
        exit 1
    fi
}

function create_directory() {
    local dir_name=${1}
    in_cyan "Creating Directory \"${dir_name}\"..."
    mkdir -p ${dir_name}
    in_green "Directory \"${dir_name}\" created successfully"
}

function create_directory_if_does_not_exist() {
    if [ -z ${1} ]
    then
        in_yellow "Usage: ./create_directory.sh PATH"
        in_yellow "i.e create_directory.sh new_directory/super_cool_directory/another_dir"
    else
        verify_directory_existence ${1}
        create_directory ${1}
    fi
}

if [ "${1}" != "--source-only" ]; then
    create_directory_if_does_not_exist"${@}"
fi