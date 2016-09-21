#!/bin/bash

if [ $# -eq 2 ]; then
	origem=$1
	destino=$2

elif [ $# -eq 3 ]; then
	origen=$2
	destino=$3
fi

arquivo=$(echo $origem | rev | cut -d "/" -f1 | rev)

diretorioOrigem=$(pwd)
cd $destino

jaContem=$(ls | grep $arquivo | wc -l)

if [ $jaContem -eq 0 ]; then

	if [ $# -eq 2 ]; then
		echo "Criando backup de $origem em $destino/$arquivo"
		cp $origem $destino

	elif [ $# -eq 3 ]; then
		echo "Criando backup de $origem em $destino/$arquivo.zip"
		cd $diretorioOrigem
		zip "$arquivo.zip" $arquivo
		mv "$arquivo.zip" $destino
	fi

	

else

	if [ $# -eq 3 ]; then
		echo "Erro: Arquivo existente $destino/$arquivo.zip"
	else

		plus=

		while [ $jaContem -ne 0 ]
		do
			plus=$(($plus + 1))
			jaContem=$(ls | grep "$arquivo.$plus" | wc -l)
		done
		arquivoPlus="$arquivo.$plus"
		echo "Criando backup de $origem em $destino/$arquivo.$plus"
		cd $diretorioOrigem
		cp $arquivo $arquivoPlus
		mv $arquivoPlus $destino
	fi
fi
