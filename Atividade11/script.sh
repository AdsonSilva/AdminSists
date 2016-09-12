#!/bin/bash

curl $1 > html.txt

quantidade=$(cat html.txt | grep "href" -wc)

echo $(cat html.txt | grep "href") > temp.txt

end=$(($quantidade*2))


for i in `seq 2 2 $end`
do
	echo $i
	cat temp.txt | cut -d '"' -f $i | tr "%20" " " |  tr -s [:space:] >> arquivos.txt

done

while read linha; do

	echo $linha

	if [[ $linha != *'/' ]]; then

		wget "$1/$linha"
	fi

done < arquivos.txt