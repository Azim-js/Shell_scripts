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

# FD0 - STDIN
# FD1 - STDOUT
# FD2 - STDERR

#  Redirect to a program using FD 0(File descriptor ) INPUT

read LINE 0< ${FILE}
echo 
echo "Line Contains : ${LINE} "

# Redirect STDOUT to a file using FD1 overwritting the file

head -n3 /etc/passwd 1> ${FILE}
echo 
echo "contents of ${FILE}:"
cat ${FILE}

# Redirect STDERR to a file using FD2 ERR

ERR_FILE='/tmp/data.err'
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

# Redirect STDOUT and STERR to a file

head -n3 /etc/passwd /fakefile &> ${FILE}
echo 
echo "contents of ${FILE}"
cat ${FILE}

# Redirect STOUT and STDERR through pipe

echo 
head -n3 /etc/passwd /fakefile |& cat -n 

# Send Output to STDERR
echo "This is STDERR!!" >&2

# Discard STDERR
echo 
echo "DISCARDING STDERR:"
head -n3 /etc/passwd /fakefile 2> /dev/null

# Discard STDOUT and STDERR 

echo "Discarding STDOUT and STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# CLEAN up

rm ${FILE} ${ERR_FILE} &> /dev/null