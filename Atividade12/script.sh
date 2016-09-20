#!/bin/bash

origem=$1
destino=$2

arquivo=$(echo $origem | rev | cut -d "/" -f1 | rev)

cd $destino

jaContem=$(ls | grep $arquivo | wc -l)

if [ $jaContem -eq 0 ]; then
	echo "Criando backup de $origem em $destino/$arquivo"
	cp $origem $destino
	

else
	plus=0

	while [ $jaContem -ne 0 ]
	do
		plus=(($plus + 1))
		jaContem=$(ls | grep "$arquivo.$plus" | wc -l)
	done
	arquivoPlus="$arquivo.$plus"
	echo "Criando backup de $origem em $destino/$arquivo.$plus"
	cd $origem
	cp $arquivo $arquivoPlus
	mv $arquivoPlus $destino
fi