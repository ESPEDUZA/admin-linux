#!/bin/sh

source ./userInput.sh

getUserName USER_NAME

source ./menu.sh
add_user

echo $USER_NAME
