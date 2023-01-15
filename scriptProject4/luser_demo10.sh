#!/bin/bash

# DRY (Dont Repeat Yourself)

# log () {
#     echo "This is a function block"
# }

# log () {
#     local MESSAGE="${@}"
#     echo "This is a message form the paramter s ${MESSAGE}"
# }

log() {
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" == 'true' ]]
    then
        echo "${MESSAGE}"
    fi    
}

log ": Greetings"
VERBOSE='true'
log ": This is Fun !"