#!/bin/bash

(echo "$SMBPW"; echo "$SMBPW") | smbpasswd -sa share

if [ $? -eq 0 ]; then

    smbd -FS

fi
