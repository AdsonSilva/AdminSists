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

	echo "EXERCICIO_$exercicio_$aluno:"

	entradas=$(ls *.in | grep "$exercicio_")

	

}



semParametro()
{
	while read linha
	do
		if [ "${linha:14}" != ".in" -o "${linha:14}" != ".out" ]; then

			aluno="${linha:13}"

			testaTodosExercicios $linha $aluno
		fi

	done < diretorio
}