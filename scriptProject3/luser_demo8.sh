#!/bin/bash

# This Script demonstrates I/O redirection
# Redirect STDOUT to a file

FILE='/tmp/data'

head -n1 /etc/passwd > ${FILE}

# Redirect SIDIN (standard input to a program)

read LINE < ${FILE}

echo "LINE contains : ${LINE}"

# Redirect STDOUT to a file overwritting the file

head -n3 /etc/passwd > ${FILE}

echo 
echo "Contents of ${FILE}:"

cat ${FILE}

# Redirect STDOUT to a file , adding to a file 

echo "${RANDOM} ${RANDOM}" >> ${FILE}

echo "${RANDOM} ${RANDOM}" >> ${FILE}

echo 

echo "contains of ${FILE}: "

cat ${FILE}

