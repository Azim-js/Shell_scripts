#!/bin/bash

# This Script creates an account on the local system 

# you will be prompted for the account name and password 

# Ask for the username 

read -p "Enter your Username: " USERNAME

# Ask for the full name 

read -p "Enter your FullName: " FULLNAME

# Ask for the Password

read -p "Enter Your Password: " PASSWORD

# Create the user 

useradd -c "{FULLNAME}" -m ${USERNAME}

# Set password for the user

echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Force Password change on the first login

passwd -e ${USERNAME}