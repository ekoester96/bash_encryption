#!/bin/bash

echo "listing files in this directory"
ls -al

read -p "which file would you like to decrypt?: " file
openssl enc -aes-256-cbc -pbkdf2 -d -in "$file" -out decrypted_"$file"

echo "$file decrypted as decrypted_$file"
