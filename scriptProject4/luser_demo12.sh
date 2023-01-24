#!/bin/bash

# THIS SCRIPT deletes a user 

#  Run as ROOT

if [[ "${UID}" -ne 0 ]]
then 
    echo "Please run with sudo or as root" >&2
    exit 1
fi

# Assume the first argument is the user to delete 

USER="${1}"

# Delete the user 

userdel ${USER}

# Make sure the user got deleted 

if [[ "${?}" -ne 0 ]]
then 
    echo "The account ${USER} was not deleted ">&2
    exit 1
fi

# The user account was deleted 

echo "The account ${USER} was deleted "
exit 0
