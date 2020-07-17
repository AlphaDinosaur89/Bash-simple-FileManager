#!/bin/bash

echo "Do you want to install? (y/n)"
echo "If you select no it will only check for updates & clone into the current dir"
echo -n "Input: "

read out

if [[ $out == "y" ]]; then

echo -n "Checking for updates. . ."
if git fetch; then
        echo -n "Update Found!"
        sudo rm -r -f Bash-simple-FileManager
        echo
        git clone https://github.com/AlphaDinosaur89/Bash-simple-FileManager.git

        ret=$?
        if ! test "$ret" -eq 0
        then
            echo >&2 "command failed with exit status $ret"
            exit 1
        fi
        echo "Success"
        sudo dpkg --install *.deb
    fi

else
    echo -n "Checking for updates. . . "
    if git fetch; then
        echo -n "Update Found!"
        echo
        sudo rm -r -f $HOME/Manager
        sudo rm -r -f Bash-simple-FileManager
        git clone https://github.com/AlphaDinosaur89/Bash-simple-FileManager.git

        ret=$?
        if ! test "$ret" -eq 0
        then
            echo >&2 "command failed with exit status $ret"
            exit 1
        fi
        echo "Success"
    fi
fi

