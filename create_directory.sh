#!/usr/bin/env bash

function in_red()     { echo -e "\033[31m${1}\033[0m"; }
function in_green()   { echo -e "\033[32m${1}\033[0m"; }
function in_cyan()    { echo -e "\033[36m${1}\033[0m"; }
function in_yellow()  { echo -e "\033[33m${1}\033[0m"; }


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

if [ -z ${1} ]
then
    in_yellow "Usage: ./create_directory.sh PATH"
    in_yellow "i.e create_directory.sh new_directory/super_cool_directory/another_dir"
else
    verify_directory_existence ${1}
    create_directory ${1}
fi

