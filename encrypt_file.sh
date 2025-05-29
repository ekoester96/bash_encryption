#!/bin/bash

echo "listing files in this directory"
ls -al

read -p "which file would you like to encrypt?: " file
openssl enc -aes-256-cbc -pbkdf2 -in "$file" -out encrypted_"$file"

echo "$file encrypted as encrypted_$file"
