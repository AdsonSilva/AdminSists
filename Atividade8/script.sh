#!/bin/bash
verificaDominio()
{
	getent hosts $1 > hosts.txt

	if [ $? -eq 0 ]; then
		quant=$(cat hosts.txt | wc -l)
		result="$1 $quant"

		mobile="m.$1"
		getent hosts $mobile > hosts.txt
		if [ $? -eq 0 ]; then
			result="$result MOBILE"
		fi

	else
		result="$1 ERRO"
	fi

	echo $result
}

if [ $1 == "-f" ]; then

	while read dominio
	do
		verificaDominio $dominio
	done < $2

else
	verificaDominio $1
fi

rm -rf hosts.txt