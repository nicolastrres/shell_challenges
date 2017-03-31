#!/usr/bin/env bash

function in_red()     { echo -e "\033[31m${1}\033[0m"; }
function in_green()   { echo -e "\033[32m${1}\033[0m"; }
function in_cyan()    { echo -e "\033[36m${1}\033[0m"; }
function in_yellow()  { echo -e "\033[33m${1}\033[0m"; }


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

if [ -z ${1} ]
then
    in_yellow "Usage: ./create_file.sh FILE_NAME"
    in_yellow "i.e create_file.sh my_file.txt"
else
    verify_file_existence ${1}
    create_file ${1}
fi