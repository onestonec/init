#!/bin/bash

FILENAME="/etc/passwd"
while IFS=: read -r username password userid groupid comment homedir cmdshell
do
	echo "$username, $userid, $homedir"
done < $FILENAME
