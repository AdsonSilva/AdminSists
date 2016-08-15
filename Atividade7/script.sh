#!/bin/bash

paginas=$1

while read endereco;
do
	curl -s --head $endereco > cabecalho.txt

	status=$(head -1 cabecalho.txt | cut -d " " -f 2)
	
	if [ $# -eq 2 ]; then
		palavras=$2

		contemPalavra=1
		curl -s $endereco > htmlCompleto.txt

		while read palavra;
		do
			if [ $(cat htmlCompleto.txt | grep $palavra | wc -l) -eq 0 ]; then
				let contemPalavra=0
				break
			fi

		done < $palavras

		if [ $contemPalavra -eq 1 ]; then

			echo "$endereco $status OK!" >> out.txt
		else
			echo "$endereco $status" >> out.txt
		fi

	else
		echo "$endereco $status" >> out.txt
	fi

done < $paginas

cat out.txt

rm -rf out.txt