#!/bin/bash

read -p "Which directory would you like to decrypt?: " directory

echo "listing all files in $directory"
ls -al $directory

read -s -p "please enter the decryption password: " password

for file in "$directory"/*;
do
  if [ -f "$file" ]
    then
      echo "decrypting $file"
      openssl enc -aes-256-cbc -pbkdf2 -base64 -d -in "$file" -out "${file}.enc" -pass pass:"$password"
      rm "$file"
  fi
done
echo
echo "list of all files after decryption in $directory"
ls -al $directory
