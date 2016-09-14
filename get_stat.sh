#!/bin/bash

echo "Getting resources list..."
#output=`azure resource list --json`
#output=`cat out`
output="$(< out)"
#echo $output
echo "Parsing results..."


regions=$(echo $output | jq '.[] | .location ' | sort -u )
regions_arr=($regions)
types=$(echo $output | jq '.[] | .type '| sort -u)

types_num=$(echo $output | jq '.[] | .type '| sort -u | wc -l)
resources_num=$(echo $output | jq '.[] | .id ' | sort -u | wc -l)

echo "resources:" $resources_num ", types: " $types_num ""
echo "Regions: "  $regions
echo "Types=" $types


echo "--- "
for i in "${regions_arr[@]}"
do
#	echo $i
#	t=$(sed -e 's/^"//' -e 's/"$//' <<< $i)
	regional_resource_types=$(echo $output | jq '.[] | select(.location == '$i') | .type' | sort -u)
	regional_resource_types_arr=($regional_resource_types)
	for j in "${regional_resource_types_arr[@]=}"
	do
#	        regional_resource_item_num=$(echo $regional_resource_types| jq '.[] | select(.type == \"'$j'\")' )
		echo "resource type=" $j "(" $regional_resource_item_num ")"
	done
	echo "-------"
        regional_resource_types_num=$(echo $output | jq '.[] | select(.location == '$i') | .type' | sort -u | wc -l)
	echo "types:" $regional_resource_types
	echo $regional_resource_types_num
#	exit
	echo "*****"
   # do whatever on $i
done
