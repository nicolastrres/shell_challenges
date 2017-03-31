#!/usr/bin/env bash

. ./print.sh


function create_new_log_file() {
    index=1

    while [[ index -lt 1000 ]]; do
        (( index=$index+1 ))
        echo $index > ${1}
    done
}

function add_logs_to_existent_log_file() {
    index=1
    while [[ index -lt 1000 ]]; do
        (( index=$index+1 ))
        echo ${index} >> ${1}
    done
}

function create_logs() {
    if [ -z ${1}  ];then
        in_yellow "Usage: ./create_logs.sh [-n] FILE_NAME"
        in_yellow "Use -n to create a new log file"
        in_yellow "i.e ./create_logs.sh my_log_file.txt"
    else
        if [ ${1} = "-n" ];then
            create_new_log_file ${2}
        else
            add_logs_to_existent_log_file ${1}
        fi
    fi
}

if [ "${1}" != "--source-only" ]; then
    create_logs "${@}"
fi