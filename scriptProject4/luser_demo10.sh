#!/bin/bash

# DRY (Dont Repeat Yourself)

# log () {
#     echo "This is a function block"
# }

# log () {
#     local MESSAGE="${@}"
#     echo "This is a message form the paramter s ${MESSAGE}"
# }

# log() {
#     local MESSAGE="${@}"
#     if [[ "${VERBOSE}" == 'true' ]]
#     then
#         echo "${MESSAGE}"
#     fi    
# }

# log() {
#     local VERBOSE="${1}"
#     shift
#     local MESSAGE="${@}"
#     if [[ "${VERBOSE}" == 'true' ]]
#     then
#         echo "${MESSAGE}"
#     fi
# }

# log ": Greetings"
# VERBOSE='true'
# log ": This is Fun !"

# VERBOSITY='true'
# log "${VERBOSITY}" "Hello!!"
# log "${VERBOSITY}" "This is Fun!"

# system logger event saved in /var/log/messages

log () {
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" == 'true' ]]
    then
        echo "${MESSAGE}"
    fi
    logger -t luser_demo10.sh "${MESSAGE}"
}

readonly VERBOSE='true'
log "HELLO !!"
log "THIS is fun!! "