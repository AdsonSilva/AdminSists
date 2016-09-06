#!/bin/bash

convertePraSegundos()
{
	hora=$1
	
	horas=$((${hora:0:2}*3600))
	minutos=$((${hora:3:2}*60))
	segundos=$((${hora:6}))

	return $(($horas+$minutos+$segundos))
	exit 1
}

convertePraSegundos "20:02:03"

echo $?
