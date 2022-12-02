#!/bin/bash

if [ $(id -u) -eq 0 ]; then	read -p "Enter the username of the user you want to delete : " USER_NAME
        if [ $(getent passwd $USER_NAME) ]
        then
                echo "user "$USER_NAME" exists"
        else
                echo -e "\033[1;31m[ERROR 9] :\033[0;37m : User '$USER_NAME' doesnt exist"
                exit 9
        fi

	read -p "Do you also want to delete user's file ? ( 0 : yes | 1 : no)" CHOICE_1

	read -p "Do you want to delete user even if he is connected ? ( 0 : yes | 1 : no)" CHOICE_2

	if [ "$CHOICE_1" -eq 0 ] && [ "$CHOICE_2" -eq 0 ]
	then
		userdel -f -r "$USER_NAME"
	fi

	if [ "$CHOICE_1" -eq 1 ] && [ "$CHOICE_2" -eq 0 ]
	then
		userdel -r "$USER_NAME"

	if [ "$CHOICE_1" -eq 0 ] && [ "$CHOICE_2" -eq 1 ]
	then
		userdel -f "$USER_NAME"
	fi

	if [ "$CHOICE_1" -eq 0 ] && [ "$CHOICE_2" -eq 0 ]
	then
		userdel "$USER_NAME"
	fi

	chmod +x ./menu.sh
	./menu.sh
else
        echo "Only root/admin may delete a user from  the system."
        exit 8
fi
