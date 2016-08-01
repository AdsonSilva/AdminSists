#!/bin/bash
#script.sh ls -l /home/aula

comando1=$1
comando2=$2
diretorio=$3

strace -T -oaux.txt $comando1 $comando2 $diretorio

