#!/bin/bash

source ./userInput.sh
if [ $(id -u) -eq 0 ]; then
while true
do
	read -p "Enter the username of the user you want to modify : " USER_NAME
	if [ $(getent passwd $USER_NAME) ]
	then
        	echo "user "$USER_NAME" exists"
	else
    		echo -e "\033[1;31m[ERROR 9] :\033[0;37m : User '$USER_NAME' doesnt exists"
                exit 9
	fi
	CHOICE=0
		while [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt 8 ]; do
                	echo ""
                	echo "Make a choice between these actions : "
                	echo ""
                	echo " 1 --> Modify user name"
                	echo " 2 --> Modify user path"
                	echo " 3 --> Modify user exiration date"
                	echo " 4 --> Modify user password"
                	echo " 5 --> Modify user default shell"
                	echo " 6 --> Modify user ID"
			echo " 7 --> Return to main menu"
                	echo " 8 --> EXIT"
                	read CHOICE
                	if [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt 8 ]
                	then
                        	echo "Your choice is not between 1 and 8, please retry"
                	fi
		done
	case "$CHOICE" in
                1)
                        getUserName NEW_USER_NAME
			sudo usermod -l "$NEW_USER_NAME" "$USER_NAME"
                        ;;
                2)
                        getUserPath USER_PATH
			usermod -d "$USER_PATH" "$USER_NAME"
                        ;;
                3)
                        getUserExp USER_EXP
			usermod -e "$USER_EXP" "$USER_NAME"
                        ;;
                4)
                        getUserPasswd USER_PASSWD
			usermod --password $(openssl passwd -6 '$USER_PASSWD') "$USER_NAME"
                        ;;
		5)
			getUserShell USER_SHELL
			usermod --shell /bin/"$USER_SHELL" "$USER_NAME"
			;;

		6)
			getUserId USER_ID
			usermod -u "$USER_ID" "$USER_NAME"
                        ;;
		7)
			chmod +x ./menu.sh
			./menu.sh
			exit 0
			;;
		8)
			exit 0
			;;
	esac
done
else
        echo "Only root/admin may modify a user to the system. retry with root or sudo"
        exit 10
fi
