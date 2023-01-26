#!/bin/bash

# grep Failed syslog-sample | awk -F 'from' '{print $2}' | awk '{print $1}'  - > to format the ip add
# grep Failed syslog-sample | awk '{print $(NF-3)}'

LIMIT='10'
LOG_FILE="${1}"

# Make sure a file was supplied as an argument

if [[ ! -e "${LOG_FILE}" ]]
then
    echo "Cannot open lof File : ${LOG_FILE}"
    exit 1
fi 

# Loop through the list of failed attempts and corresponding IP address

grep Failed syslog-sample | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
    # if the number of failed attempts is greater then the limit display coount IP and location 
    if [[ "${COUNT}" -gt "${LIMIT}" ]]
    then 
        LOCATION=$(geoiplookup ${IP} | awk -F ',' '{print $2}')
        echo "Count: ${COUNT} , IP: ${IP}, Location: ${LOCATION}"
    fi
done
exit 0

