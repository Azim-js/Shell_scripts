#!/bin/bash

# Display the UID and username of the user executing this script 

# Display if user is root user or not 

echo "Your UID is ${UID}"

# Display the UID 

# USERNAME=`id -un`

USERNAME=$(id -un)

echo "Your username is ${USERNAME}"

# DIsplay if the user is the root user or not 

if [[ "${UID}" -eq 0 ]]
then
    echo 'You are root'
else 
    echo 'You are not root'
fi