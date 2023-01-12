#!/bin/bash

# This Script creates a new user on the local system 
# you will be prompted to enter the username login the person name and a password
# The username password and host for the account will be displayed 

# Make sure the script is being executed as Superuser privilages

if [[ "${UID}" -ne 0 ]]
then 
    echo "please run the script as sudo"
    exit 1
fi

# GET the Username
read -p "Enter your Username: " USER_NAME

# Get the decription of the account creation
read -p "Enter your Fullname for the account creation: " COMMENT

# Get the Password 
read -p "Enter the Password for the account: " PASSWORD

# Create an Account
useradd -c "${COMMENT}" -m ${USER_NAME}

# check to see if the user add succeeded
if [[ "${?}" -ne 0 ]]
then 
    echo "The account creation had a problem please run script as sudo "
    exit 1
fi

echo "The account creation was Successfull"

# Set the Password
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}

# check if succedded
if [[ "${?}" -ne 0 ]]
then
    echo "The Password creation was not successful please try again: "
    exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME}

# Display the username, passwordand the hostname where it was created 

echo
echo "USERNAME :"
echo "${USER_NAME}"
echo 
echo "PASSWORD :"
echo "${PASSWORD}"
echo
echo "HOSTNAME :"
echo "${HOSTNAME}"

exit 0