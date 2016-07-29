#!/bin/bash

if [ $# -eq 0 ]; then
	semParametro
else
	comParametro $1 $2
fi

comParametro()
{
	exercicio=$1
	aluno=$2

	testaExercicio exercicio aluno

}

testaExercicio()
{
	exercicio=$1
	aluno=$2

	nomeDoExercicio='EXERCICIO_'$exercicio'_'$aluno
	echo $nomeDoExercicio':'

	entradas=$(ls *.in | grep $exercicio'_')

	numEntrada=0
	for entrada in entradas;
	do
		set numEntrada=$numEntrada + 1
		echo '- SAIDA PARA ENTRADA '$numEntrada':'
		$(./$nomeDoExercicio.sh < $entrada > aux.out)
		cat aux.out
		echo

	done
	set numEntrada=0

	

}

