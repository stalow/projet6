#!/bin/bash

entrees=("openphish.txt","phishunt.txt")
len=${#entrees[@]}
while [[ $k -lt $len ]];
do
input=${entrees[$k]}
i=0
while read line;
do
   num=$(grep -o "/" <<< "$line" | wc -l)
   if [[ num -gt 2 ]]
   then 
      #echo "${num}"
      num=$((num-2))
      while [[ num -gt 0 ]]
      do 
         #echo "origine : ${line}"
         comptePoint="${line: -5}"
         #echo "comptepoint : ${comptePoint}"
         comptePoint="${comptePoint//[^.]}"
         comptePoint="${#comptePoint}"
         #echo "compte point : ${comptePoint}"
         if [[ comptePoint -gt 0 ]] 
            then
                #echo "Il y a un point"
                newline="${line%.*}.zip"
         else
                #echo "Pas de point"
                newline="${line}.zip"
         fi
         curl "${newline}" -o "zips/zip${i}.zip"
         mkdir "zips/folder${i}" 
         unzip "zips/zip${i}.zip" -d "zips/folder${i}"  || rm "zips/zip${i}.zip" | rmdir "zips/folder${i}"
         echo "tested URL : ${newline}"
         newline="${newline%/*}"
         #echo "tested bis : ${newline}"
         num=$((num-1))
         line="${newline}"
         #On incrémente l'indice pour pouvoir créer un zip au nom différent
         i=$((i+1))
      done
   fi
done < $input
let k++
done