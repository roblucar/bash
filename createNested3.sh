#!/bin/bash

ARR=( {48..57} {65..90} {97..122} )

arrcount=${#ARR[@]}
#echo $arrcount
# return a random string
get_rand_dir(){
    for ((i=1; i<$((RANDOM%5)); i++)) {
        printf $(printf '%03o' ${ARR[RANDOM%arrcount]});
    }
}

#dir=./
declare -a dir
for ((i=0; i<$((RANDOM%10)); i++)) {
    dir+=("$(get_rand_dir)")
#   echo "${dir[$i]}"
}

cd ./
for CURRENT in "${dir[@]}"; 
do
	if [ "$CURRENT" ];
	then
		mkdir -pv "$CURRENT"
		cd $CURRENT
		
		for ((k=0; k<$((RANDOM%10)); k++)) {
			base64 /dev/urandom | head -c 10000 > $(( ( RANDOM % 1000 )  + 1 )).txt
		}
	    for ((i=0; i<$((RANDOM%10)); i++)) {
	    	myDir=$(get_rand_dir)
	        mkdir -pv $CURRENT/$myDir #$(get_rand_dir)
	        cd $CURRENT/$myDir 
	        echo current dir $(pwd)
	        for ((j=0; j<$((RANDOM%10)); j++)) {
	        	base64 /dev/urandom | head -c 10000 > $(( ( RANDOM % 1000 )  + 1 )).txt
	        }
	        cd ..
	    }	
	    cd ..
	fi
done