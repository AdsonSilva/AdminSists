#!/bin/bash
#script.sh ls -l /home/aula

comando1=$1
comando2=$2
diretorio=$3

strace -T -oaux.txt $comando1 $comando2 $diretorio

sort -r -t'<' -k2,2n aux.txt > sorted.txt

tail -n 3 sorted.txt > aux.txt
tac aux.txt > reverse.txt

while read linha;
do
	echo $linha
done < reverse.txt

rm -rf aux.txt
#rm -rf sorted.txt
rm -rf reverse.txt
