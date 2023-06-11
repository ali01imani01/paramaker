#! /usr/bin/bash

# Usage:
# bash paramaker.sh -l parameters.txt -e snoopy 
while getopts 'l:e:' flag; do
  case "${flag}" in
    e) ent="${OPTARG}";;
    l) list="${OPTARG}";;
  esac
done

lines=$(wc -l < "$list")
for ((i=25; i<=$lines+25; i+=25)); do
    head -n $i "$list" | tail -n 25 | tr '\n' ' ' | sed "s/ /=$ent\&/g"
    echo ""
done