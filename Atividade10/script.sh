#!/bin/bash

while read linha; do
	checagem=$(echo $linha | cut -d " " -f 1)
	algoritmo=$(echo $linha | cut -d " " -f 2)
	arquivo=$(echo $linha | cut -d " " -f 3-)

	existencia=$(ls | grep "$arquivo" -wc)

	if [ $existencia -eq 1 ]; then

		if [ $algoritmo == "MD5" ]; then
			comando="md5sum"

		elif [ $algoritmo == "CRC" ]; then
			comando="cksum"

		elif [ $algoritmo == "SHA1" ]; then
			comando=sha1sum
			
		fi
		
		checagemFeita=$($comando $arquivo | cut -d " " -f 1)

		if [ $checagemFeita == $checagem ]; then
			status="OK"
		else
			status="ERROR"
		fi

	else
		status="NOT_FOUND"
	fi

	status="$status $arquivo"

	echo $status
done < $1