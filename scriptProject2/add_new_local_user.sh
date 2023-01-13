#!/bin/bash

# This Script creates a new user on the local system 
# You must specify a username as an argument to the script 
# optionally you can also provide a comment for the account as an argument

# A password will be automatically genrated for the account 

# The username , password and host for the account will be displayed 

# make sure the script is being executed with Superuser privilages

if [[ "${UID}" -ne 0 ]]
then 
    echo "Please run with Sudo or root privilage "
    exit 1
fi

# if they don't supply at least one argument then give them help 

if [[ "${#}" -lt 1 ]]
then 
    echo "USAGE : ${0} USER_NAME [COMMENT] ..."
    echo "Create an account on the local system with the name of USER_NAME and a comment fiels of comments"
    exit 1
fi

# The first Parameter is the Username 

USER_NAME="${1}"

# The rest od the parameter are for the account comments 

shift

COMMENT="${@}"

# Generate a password 

PASSWORD=$(date "+%s%N" | sha256sum | head -c48)

# Create the user with the password

useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check id the Useradd command useradd 

# We don't want to tell user that an account was created when it has'nt been 

if [[ "${?}" -ne 0 ]]
then 
    echo "The account could'nt be created "
    exit 1 
fi

# Set the Password 

echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

# Check to see if the password command succeeded 

if [[ "${?}" -ne 0 ]]
then
    echo "The password for the account could'nt be set "
    exit 1
fi

# Force password change obn first login

passwd -e ${USER_NAME}

# Display the username , password at the host which user was created 

echo 
echo 'USERNAME: '
echo "${USER_NAME}"
echo 
echo "PASSWORD: "
echo "${PASSWORD}"
echo
echo "HOSTNAME: "
echo "${HOSTNAME}"
exit 0

