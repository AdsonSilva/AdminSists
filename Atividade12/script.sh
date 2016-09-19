#!/bin/bash

origem=$1
destino=$2

arquivo=$(echo $origem | rev | cut -d "/" -f1 | rev)

cd $destino

diretorioAtual=$(ls | grep $arquivo | wc -l)
