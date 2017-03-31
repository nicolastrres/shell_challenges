#!/usr/bin/env bash
# vim: ft=sh:

. ./create_directory.sh --source-only
. ./create_file.sh --source-only
. ./read_from_file.sh --source-only
. ./copy_command_output.sh --source-only
. ./print.sh --source-only


if [ -z ${1} ];then
    in_yellow "create-file               Create a file. Receives the file name as argument."
    in_yellow "create-directory          Create a directory. Receives the path as argument."
    in_yellow "read-file                 Read a specific file (or a default one). Receives file name as argument."
    in_yellow "copy-command-output       Copy the output of a command to the clipboard. Receives a command as argument."
else
    case ${1} in
        create-file)
            create_file_if_does_not_exist ${@:2}
        ;;

        create-directory)
            create_directory_if_does_not_exist ${@:2}
        ;;

        read-file)
            read_file ${@:2}
        ;;

        copy-command-output)
            copy_command_output ${@:2}
        ;;
    esac
fi