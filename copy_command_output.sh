#!/usr/bin/env bash

. ./print.sh

function copy_command_output() {
    if [ -z ${1} ]
    then
        in_yellow "Usage: ./copy_command_output.sh COMMAND"
        in_yellow "i.e ./copy_command_output.sh cat default_file.txt"
    else
        eval "${@}" | pbcopy
    fi
}

if [ "${1}" != "--source-only" ]; then
    copy_command_output "${@}"
fi