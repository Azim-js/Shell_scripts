#!/bin/bash

# path to archive the UserDIR to be deleted 

ARCHIVE_DIR='/archive'

# Usage function or () or method 

usage() {
    # Display the usage and exit 
    echo "USAGE : ${0} [-dra] USER [USERN]...." >&2
    echo "Disable a local linux account." >&2
    echo "-d Delete accounts instead of the disabling them" >&2
    echo "-r Removes the home directory assosciated with the account" >&2
    echo "-a Creates an archive of the home directory associated with the accounts" >&2
    exit 1
}

# This Script disables,deletes and/or archives user on the local system 

# Make sure the script is being executed with super privileges 

if [[ "${UID}" -ne 0 ]]
then 
    echo "Please run with sudo or root." >&2
    exit 1
fi

# Parse the OPTION 

while getopts dra OPTION 
do 
    case ${OPTION} in 
        d) DELETE_USER='true';;
        r) REMOVE_OPTION='-r';;
        a) ARCHIVE='true';;
        ?) usage;;
    esac
done

# Renmove the options while leaving the removing arguments

shift "$(( OPTIND -1 ))"

# If the user dosen't supply at least one arguent, give them help 

if [[ "${#}" -lt 1 ]]
then 
    usage
fi 

# Loop through all the usernames supplied as arguments 

for USERNAME in "${@}"
do 
    echo "Processing user : ${USERNAME}"

    # Make sure the UID of the account is at least 1000

    USERID=$(id -u ${USERNAME})

    if [[ "${USERID}" -lt 1000 ]]
    then 
        echo "Refershing to remove the ${USERNAME} account with UID ${USERID}" >&2
        echo "Please Eneter a user who has id greater or equal to 1000"
        exit 1
    fi

    # Create an active if requested to do so 

    if [[ "${ARCHIVE}" == "true" ]]
    then 
        # Make sure the Archive_DIR exists 
        # ! -d (checking if the DIR dosent exists) 
        
        if [[ ! -d "${ARCHIVE}" ]]
        then 
            echo "Creating ${ARCHIVE_DIR} directory."
            mkdir -p ${ARCHIVE_DIR}

            if [[ "${?}" -ne 0 ]]
            then 
                echo "The archive directory ${ARCHIVE_DIR} could not be created. " >&2
                exit 1
            fi
        fi

        # Archive the users home directory and move it into the ARCHIVE_DIR

        HOME_DIR="/home/${USERNAME}"
        ARCHIVE_FILE="${ARCHIVE_DIR}/${USERNAME}.tgz"

        if [[ -d "${HOME_DIR}" ]]
        then 
            echo "Archiving ${HOME_DIR} to ${ARCHIVE_FILE}"

            tar -zcf ${ARCHIVE_FILE} ${HOME_DIR} &>/dev/null

            if [[ "${?}" -ne 0 ]]
            then 
                echo "Could not create a ${ARCHIVE_FILE}" >&2
                exit 1
            fi 
            else
                echo "${HOME_DIR} does not exists or is not a directory " >&2
                exit 1
        fi 
    fi

    if [[ "${DELETE_USER}" == "true" ]]
    then 
        # Delete the user 

        userdel ${REMOVE_OPTION} ${USERNAME}

        # Check to see if the userdel command succeeded 
        # We don't want to tell user that account was deleted when it hasn't been

        if [[ "${?}" -ne 0 ]]
        then 
            echo "The account ${USERNAME} was not deleted "
            exit 1
        fi 

        echo "The account ${USERNAME} was deleted "
        
        else 
            # Lock the account 
            chage -E 0 ${USERNAME}
            
            if [[ "${?}" -ne 0 ]]
            then 
                echo "The locking of the account wasn't successfull" >&2
                exit 1
            fi
        
        # check to see if the Chage command succeeded 
        # we don't want to tell the user that an account was disabled when it hasn't been 

        if [[ "${?}" -ne 0 ]]
        then 
            echo "The account ${USERNAME} was not disabled." >&2
            exit 1
        fi

        echo "The account ${USERNAME} was deleted "
    fi
done 
exit 0
    



