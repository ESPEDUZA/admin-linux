#!/bin/bash

source ./userInput.sh
if [ $(id -u) -eq 0 ]; then






else
        echo "Only root/admin may add a user to the system."
        exit 8
fi
