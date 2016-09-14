#!/bin/bash

echo "Getting resources list..."
#output=`azure resource list --json`
#output=`cat out`
output="$(< out)"
#echo $output
echo "Parsing results..."
#exit
#declare -a regions=()
for i in $output; do
	#tmp=$(echo $i )
	tmp=$(head -c $i; echo .); tmp=${tmp%.}
	echo $tmp
#	echo $i
	if [[ ! -z "${tmp// }" ]]; then
		echo $tmp | awk {'print $1; print $2; print $3; print $4; print $5; print $6'};
	fi
done

