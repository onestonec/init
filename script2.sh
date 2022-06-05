#!/bin/bash

user="$(w | grep -v tty | awk 'NR>2{print $1}')"
terminal="$(w | grep -v tty | awk 'NR>2{print $2}')"
echo $terminal
echo $user
pkill -f $user@$terminal
pgrep -u $user | while read PID; do sudo kill $PID; done
sudo userdel -r $user
