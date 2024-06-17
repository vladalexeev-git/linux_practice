#!/bin/bash

echo "Input your number:"
read -r number

# check if we really got a number
if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Your input is not a correct number."
    exit 1
fi

# and do main check
if [ "$number" -gt 0 ]; then
    echo "Number $number is positive."
elif [ "$number" -lt 0 ]; then
    echo "Number $number is negative."
else
    echo "Number $number is zero."
fi
