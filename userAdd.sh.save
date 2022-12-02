#!/bin/bash

source ./userInput.sh
if [ $(id -u) -eq 0 ]; then

	echo "How many user do you want to add ?"
	read CPT
	echo "$CPT"
	for var in $(seq 1 $CPT)
	do
		getUserName USER_NAME
		getUserPath USER_PATH
		getUserExp USER_EXP
		getUserPasswd USER_PASSWD
		getUserShell USER_SHELL
		getUserId USER_ID
		echo "$USER_NAME $USER_PATH $USER_EXP $USER_PASSWD $USER_SHELL $USER_ID"
		#useradd -b "$USER_PATH" -m "$USER_NAME" -s /"$USER_SHELL" -d /home/ -e "USER_EXP" -p "$USER_PASSWD" -u "$USER_ID" 
		useradd -m -s /usr/bin/"$USER_SHELL" -b "$USER_PATH" -e "$USER_EXP" -p "$USER_PASSWD" -u "$USER_ID" "$USER_NAME"
	echo "User '$USER_NAME' succsessfully added !"
	done

	chmod +x ./menu.sh
	./menu.sh
else
	echo "Only root/admin may add a user to the system."
	exit 8
fi
