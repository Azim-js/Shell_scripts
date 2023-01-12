#!/bin/bash

# Display the UID and username of the user executing this script

echo "your UID is ${UID}"

#only display if the UID does not match 1000

UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
    echo "Your UID does not match ${UID_TO_TEST_FOR}"
    exit 1
fi

# Display the USERNAME

USERNAME=$(id -un)

# Test if the command succeeeded

if [[ "${?}" -ne 0 ]]
then 
    echo "The id Command did not execute successfully"
    exit 1
fi

echo "Your username is ${USERNAME}"

# You can use a string test conditional 

USERNAME_TO_TEST_FOR='Vagrant'

if [[ "${USERNAME}" == "${USERNAME_TO_TEST_FOR}" ]]
then
    echo "Your username matches ${USER_NAME_TO_TEST_FOR}"
fi

# Test for != (not equal) for the string

if [[ "${USERNAME}" != "${USERNAME_TO_TEST_FOR}" ]]
then
    echo "Your username does not matches ${USER_NAME_TO_TEST_FOR}"
    exit 1
fi

exit 0