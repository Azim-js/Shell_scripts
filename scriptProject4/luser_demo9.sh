#!/bin/bash

# This Script demonstrates the case statements 

# if [[ "${1}" == 'start' ]]
# then 
#     echo "Starting"
# elif [[ "${1}" == 'stop' ]]
# then
#     echo "Stoping"
# elif [[ "${1}" == 'status' ]]
# then 
#     echo "status: "
# else
#     echo "Supply a valid option " >&2
#     exit 1
# fi

# Case statements for above block of code 

case "${1}" in 
    start)
        echo "starting"
        ;;
    stop)
        echo "stopping"
        ;;
    status|--status|-status)
        echo "Status: "
        ;;
    *)
        echo "Please supply a valid option" >&2
        exit 1
        ;;
esac  