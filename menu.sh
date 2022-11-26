#!/bin/sh


function add_user(){
	CPT=0
	CURRENT_DATE=$(date '+%s')
	echo "current date $CURRENT_DATE"
	echo "How much user(s) do you want to create ?"
	read CPT
	#Retrieve data from user input
	for i in {0. .CPT. .1}
	do

		echo "Enter username :"
        	read USER_NAME
		if [[ -z "$USER_NAME" ]]
		then
			echo -e "\033[1;31m[ERROR] :\033[0;37m Empty user name"
			exit 1
		fi
        	echo "Enter the user folder path :"
        	read USER_PATH
		if [[ -z "$USER_PATH" ]]
                then
                        echo -e "\033[1;31m[ERROR] :\033[0;37m Empty path"
                        exit 2
                fi
		if [ -d "$USER_PATH" ]
		then
			echo -e "\033[1;31m[ERROR] :\033[0;37m This path already exists"
			exit 3
		fi
        	echo "Enter an expiration date (YYYY-MM-DD) :"
        	read USER_EXP
		if [[ -z "$USER_EXP" ]]
                then
                        echo -e "\033[1;31m[ERROR] :\033[0;37m Empty expiration date"
                        exit 4
                fi

		USER_EXP=$(date -d ${USER_EXP} +%s)
		echo "$USER_EXP"

		if [[ $USER_EXP -le $CURRENT_DATE ]]
		then
			echo -e "\033[1;31m[ERROR] :\033[0;37m Expiration date lower than current date"
			exit 5
		fi
        	echo "Enter password :"
        	read USER_PASSWD
        	echo "Enter a Shell :"
   	    	read USER_SHELL
		if [[ -z "$USER_PATH" ]]
                then
                        echo "[ERROR] : Empty shell field"
                        exit 6
                fi
        	echo "Enter an id :"
        	read USER_ID

		#Create a user from actual user input
        	echo -e "User : $USER_NAME has been successfully added!\n\n"


	done
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
