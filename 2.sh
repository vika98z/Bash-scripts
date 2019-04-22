#!/bin/bash
while read LINE
do
  last_word=`echo "$LINE" | grep -oE '[^ ]+[ ]*$'` #последнее слово в строке
  neprob=`echo "$LINE" | grep -o '\S' | wc -l` #кол-во непробельных символов в строке
  count=`echo "$LINE" | wc -w` #кол-во слов в строке LINE
  ll=$(( $neprob + $(($count - 1)) ))
  if [[ $ll -lt 80 && $count -gt 1 ]] #если символов <80 и более чем одно слово
  then
    g=$(( $(( 80 - $neprob))/$(($count - 1)) ))
    mod=$(( $(( 80 - $neprob))%$(($count - 1)) ))
    for word in $LINE 
    do
	echo -n $word
	if [ "$word" != "$last_word" ] #если слово не последнее, добавляем пробелы
	then 
	  for ((i=0; i<($g) ; i++))
	  do 
		printf ' '
	  done
	  if [[ $mod -gt 0 ]]
	  then
		printf ' '
		mod=$(( $mod - 1 ))
	  fi
	fi
    done
    echo
  else
    echo $LINE #просто выводим имеющуюся строку, если в ней >=80 символов или лишь одно слово
  fi
done < $1
