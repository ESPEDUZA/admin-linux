#!/bin/sh


function add_user(){

        echo "Enter username :"
        read USER_NAME
        echo "Enter the user folder path :"
        read USER_PATH
        echo "Enter an expiration date :"
        read USER_EXP
        echo "Enter password :"
        read USER_PASSWD
        echo "Enter a Shell :"
        read USER_SHELL
        echo "Enter an id :"
        read USER_ID

        echo -e "User : $USER_NAME has been successfully added!\n\n"
	menu
}


#Menu and displaying options
function menu(){
	CHOICE=0
	while [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt 4 ]
	do
		echo ""
		echo "Make a choice between these actions : "
		echo ""
		echo " 1 --> Add user"
		echo " 1 --> Modify user"
		echo " 3 --> Delete user"
		echo " 4 --> Exit"
		read CHOICE
		if [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt 4 ]
		then
			echo "Your choice is not between 1 and 4 please retry"
		fi
	done

	#Executing the corresponding function to user's choice
	case $CHOICE in

        	1)
                	add_user
                	;;
        	2)
                	echo "WIP"
                	;;
        	3)
                	echo "WIP"
                	;;
        	4)
                	echo exit $0
                	;;
	esac
}


echo "Welcome to User admin !"
menu
