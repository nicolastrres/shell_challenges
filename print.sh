#!/usr/bin/env bash

function in_red()     { echo -e "\033[31m${1}\033[0m"; }
function in_green()   { echo -e "\033[32m${1}\033[0m"; }
function in_cyan()    { echo -e "\033[36m${1}\033[0m"; }
function in_yellow()  { echo -e "\033[33m${1}\033[0m"; }