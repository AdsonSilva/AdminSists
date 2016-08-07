#!/bin/bash

#funcionalidade extra - receber um endereco como paramentro
if [ $# == 0 ]; then
	endereco='www.tecmundo.com.br'
else
	endereco=$1
fi

ping -c 10 -s 48 $endereco | grep 'time=' > pingOut.txt
