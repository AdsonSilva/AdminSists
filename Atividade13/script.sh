#!/bin/bash

copiaArquivo(){
	arq=$1
	diret=$2

	cp $arq $diret
}

checaDiretorio(){
	arq=$1
	#verifica se contem
	contem=$(ls | grep $arq | wc -l)
	echo $contem
}

checaSubdiretorios(){
	arq=$1
	contem=$(checaDiretorio $arq)

	if [ $contem -eq 0 ]; then
		find $diretorio -type d > diretorios.txt

		while read subdiretorio; do
			cd subdiretorio
			contem=$(checaDiretorio $arq)

			if [ $contem -eq 1 ]; then
				break
			fi

		done < diretorios.txt

	fi
	echo $contem
}

checaArquivo(){
	palavra=$1
	arq=$2

	quantidade=$(cat $arq | grep $palavra | wc -l)

	echo $quantidade
}

param=$1
arquivo=$2
diretorio=$3

if [ $param == "-e" ]; then
	contem=$(checaDiretorio $arquivo)
	if[ contem -eq 0 ]; then
		copiaArquivo $arquivo $diretorio
	fi

elif [ $param == "-s" ];then
	contem=$(checaSubdiretorios $arquivo)
	if[ contem -eq 0 ]; then
		copiaArquivo $arquivo $diretorio
	fi

elif [ $param == "-d" ]; then
	contem=$(checaDiretorio $arquivo)
	if[ contem -eq 1 ]; then
		rm -rf $arquivo
	fi

elif [ $param == "-c" ]; then
	palavra=$2

	quantidade=$(checaArquivo $palavra $arquivo)

	if [ $quantidade -eq 0 ]; then
		echo $palavra >> $arquivo
fi