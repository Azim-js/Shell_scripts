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
    # This function senda a message to syslog and to standard output if VERBOSE is true
    local MESSAGE="${@}"
    if [[ "${VERBOSE}" == 'true' ]]
    then
        echo "${MESSAGE}"
    fi
    logger -t luser_demo10.sh "${MESSAGE}"
}

# readonly VERBOSE='true'
# log "HELLO !!"
# log "THIS is fun!! "

backup_file() {
    # This function creates a backup of a file returns non-zero status on error
    local FILE="${1}"

    # MAKE sure the file exists 

    if [[ -f "${FILE}" ]]
    then
        local BACKUP_FILE="/var/tmp/$(basename ${FILE})$(date "+%F-%N")"
        log "BACK UP ${FILE} to ${BACKUP_FILE}"

        # The exit status of the function will be the exit status of the cp command 

        cp -p ${FILE} ${BACKUP_FILE}
    else    
        # The file dose not exist, so return a non zero exit status
        return 1
    fi 
}

readonly VERBOSE='true'
log "HELLO"

log "THIS is Fun!"

backup_file "/etc/passwd"

# Make sure a decision on the exit status of the function 

if [[ "${?}" -eq 0 ]]
then
    log "FILE backup succedded"
else 
    log "file backup failed!!"
    exit 1
fi

