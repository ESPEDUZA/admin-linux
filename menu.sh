#!/bin/sh


#Menu and displaying options

	CHOICE=0
	while [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt 4 ]
	do
		echo ""
		echo "Make a choice between these actions : "
		echo ""
		echo " 1 --> Add user"
		echo " 2 --> Modify user"
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
			chmod +x ./userAdd.sh
			./userAdd.sh
                	;;
        	2)
                	echo "WIP"
                	;;
        	3)
                	echo "WIP"
                	;;
        	4)
                	echo exit 0
                	;;
		esac


