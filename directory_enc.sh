#!/bin/bash

read -p "Which directory would you like to encrypt?: " directory

echo "listing all file in $directory"
ls -al $directory

read -s -p "please enter an encryption password: " password

for file in "$directory"/*;
do
  if [ -f "$file" ]
    then
      echo "encrypting $file"
      openssl enc -aes-256-cbc -pbkdf2 -base64 -in "$file" -out "${file}.enc" -pass pass:"$password"
      rm "$file"
  fi
done
echo
echo "list of all files after encryption in $directory"
ls -al $directory
