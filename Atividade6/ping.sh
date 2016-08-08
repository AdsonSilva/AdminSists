#!/bin/bash

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

#pacotes com 64 bytes
ping -c 10 -s 64 $endereco | grep 'time=' > pingOut.txt

sort -n -t'=' -k4,4n pingOut.txt > sorted.txt

tail -3 sorted > maiores

meio=$(sed -n 5' p;' sorted.txt)

echo "Tempo medio de pacotes com 64 bytes: ${meio:(-6)}"

#excluindo arquivos auxiliares
rm -rf pingOut.txt
#rm -rf sorted.txt

#Respostas
#1: X representa o endereco atribuido ao ip acessado
#   Y representa o IP do endereco acessado
#   z reprezenta o tamanho em bytes do pacote enviado
#2: A representa o tamanho em bytes do pacote recebido
#   B representa o endereco atribuido ao ip que responde
#   C representa o IP do endereco que responde