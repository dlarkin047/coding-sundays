#!/bin/bash
EMAIL=$1
NAME=${1:-id_rsa}
SIZE=${2:-4096}
DEST=${3:-$HOME/Keys/}
PRIK=$DEST$NAME.pem
PUBK=$DEST$NAME.pub

mkdir -p $DEST

if [ -f "$PRIK" ] || [ -f "$PUBK" ]; then
	echo "A key by that name already exists"
	exit 0
fi

#Generating keys if they do not exists

echo "When asked for a password, please enter a rememberable one. OR press enter and do not enter a password."
ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f $DEST$NAME

echo "---------------------------- Copy the below SSH key into github ------------------------"
cat ~/Keys/id_rsa.pub
echo "----------------------------------------------------------------------------------------"
echo "SSH key successfully created!"

exit
