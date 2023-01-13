#!/bin/bash

# This Script generates a random password for each user specified on the command line

# Display what the user typed on the command line

echo "You executed the command : ${0} "

# Display the path and file name of the script 

echo "The path the script got executed is : $(dirname ${0}) and the name of the script is : $(basename ${0})"

# Tell Them how many arguments they passed in the command line

# Inside the script they are parameters , outside they are arguments

NUMBER_OF_PARAMETERS="${#}"

echo "you supplied ${NUMBER_OF_PARAMETERS} arguments on the command line"

# Make sure they at least supply one argument 

if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then 
    echo "USAGE : ${0} USERNAME [USERNAME] ..."
    exit 1
fi

# Genrate aand display a password for each parameter

for USER_NAME in "${@}"
do 
    PASSWORD="$(date "+%s%N" | sha256sum | head -c48)"
    echo "${USER_NAME} : ${PASSWORD}"
done

