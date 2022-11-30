#!/bin/bash

function getUserName(){
        echo "Enter username :"
        read USER_NAME
        if [[ -z "$USER_NAME" ]]
        then
                echo -e "\033[1;31m[ERROR 1] :\033[0;37m Empty user name"
                exit 1
        fi
        eval "$1='$USER_NAME'"
}

function getUserPath(){
	echo "Enter the user folder path :"
	read USER_PATH
        if [[ -z "$USER_PATH" ]]
        then
        	echo -e "\033[1;31m[ERROR 2] :\033[0;37m Empty path"
                exit 2
        fi
       	if [ -d "$USER_PATH" ]
        then
        	echo -e "\033[1;31m[ERROR 3] :\033[0;37m This path already exists"
        	exit 3
        fi
	eval "$1='$USER_PATH'"
}

function getUserExp(){
	echo "Enter an expiration date (YYYY-MM-DD) :"
        read USER_EXP
        if [[ -z "$USER_EXP" ]]
        then
        	echo -e "\033[1;31m[ERROR 4] :\033[0;37m Empty expiration date"
                exit 4
        fi

        USER_EXPS=$(date -d ${USER_EXP} +%s)

        if [[ $USER_EXPS -le $CURRENT_DATE ]]
        then
        	echo -e "\033[1;31m[ERROR 5] :\033[0;37m Expiration date lower than current date"
                exit 5
        fi
	eval "$1='$USER_EXP'"
}

function getUserPasswd(){
        read -s -p"Enter password :'\n'" USER_PASSWD
	eval "$1='$USER_PASSWD'"
}

function getUserShell(){
	echo "Enter a Shell :"
        read USER_SHELL
        if [[ -z "$USER_SHELL" ]]
        then
        	echo -e "\033[1;31m[ERROR 6] :\033[0;37m Empty shell field"
                exit 6
        fi

        "$USER_SHELL" --version 2>/dev/null || echo -e '\033[1;31m[ERROR] :\033[0;37m "$USER_SHELL" is not installed'
        "$USER_SHELL" --version 2>/dev/null || exit 7
	eval "$1='$USER_SHELL'"
}

function getUserId(){
	echo "Enter an id :"
        read USER_ID
}







