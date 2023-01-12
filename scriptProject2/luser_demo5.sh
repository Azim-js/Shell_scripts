#!/bin/bash

# This script generates a list of random passwords

PASSWORD="${RANDOM}"

echo "${PASSWORD}"

# Three random numbers together 

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"

echo "${PASSWORD}"

# Use the event date/time as the creation of stronger password

PASSWORD=$(date "+%s")

echo "${PASSWORD}"

# use Nanoseconds to act as randomization 

PASSWORD=$(date "+%s%N")

echo "${PASSWORD}"

# A Better PASSWORD

PASSWORD=$(date "+%s%N") | sha256sum | head -c32

echo "${PASSWORD}"


#  A EVEN Better Password

SPECIAL_CHARACTER=$(echo '!@#%$^&*()_+' | fold -w1 | shuf | head -c1)

PASSWORD=${PASSWORD}${SPECIAL_CHARACTER}

echo "${PASSWORD}"