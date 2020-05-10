#!/bin/sh

mkdir ./results  > /dev/null 2>&1


domain="$1"

path="./results"

sub(){
	amass enum -passive -d  "$domain" -o $path/amass  >> /dev/null 2>&1
	assetfinder --subs-only "$domain" >> /dev/null 2>&1  > $path/asset 
	subfinder -silent -t 30 -d "$domain" -o $path/sub  >> /dev/null 2>&1

}

sub

resolve(){
	
	cat $path/asset $path/sub $path/amass | sort | uniq  > $path/unresolved
	fping -a < $path/unresolved >> /dev/null 2>&1 > $path/final
}

resolve
