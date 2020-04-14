#!/bin/bash

echo "Setting password to $SMBPW"

(echo "$SMBPW"; echo "$SMBPW") | smbpasswd -sa share

if [ $? -eq 0 ]; then

    smbd -FS

fi
