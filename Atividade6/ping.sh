#!/bin/bash

media3maiores()
{
	tail -3 $1 > maiores.txt

	soma=0

	while read linha
	do
		maior=${linha:(-6):3}
		let soma=$soma+$maior

	done < maiores.txt

	media=$(((soma/3)))

	echo "A media dos 3 maiores tempos eh: $media"

	rm -rf maiores.txt
}


#funcionalidade extra - receber um endereco como paramentro
if [ $# == 0 ]; then
	endereco='www.tecmundo.com.br'
else
	endereco=$1
fi

#pacotes com 56 bytes
ping -c 10 $endereco | grep 'time=' > pingOut.txt

sort -n -t'=' -k4,4n pingOut.txt > sorted.txt

meio=$(sed -n 5' p;' sorted.txt)

echo "Tempo medio de pacotes com 56 bytes: ${meio:(-6)}"

media3maiores sorted.txt

#pacotes com 64 bytes
ping -c 10 -s 64 $endereco | grep 'time=' > pingOut.txt

sort -n -t'=' -k4,4n pingOut.txt > sorted.txt


meio=$(sed -n 5' p;' sorted.txt)

echo "Tempo medio de pacotes com 64 bytes: ${meio:(-6)}"

media3maiores sorted.txt

#excluindo arquivos auxiliares
rm -rf pingOut.txt
rm -rf sorted.txt


#Respostas
#1: X representa o endereco atribuido ao ip acessado
#   Y representa o IP do endereco acessado
#   z reprezenta o tamanho em bytes do pacote enviado
#2: A representa o tamanho em bytes do pacote recebido
#   B representa o endereco atribuido ao ip que responde
#   C representa o IP do endereco que responde