#!/bin/bash
rand=0 #random number 1000-9999
count=0 #кол-во одинаковых десятичных позиций (от 0 до 4)
while [ "$rand" -le "999" ] #устанавливаем границу снизу - пока rand<=999
do
  rand=$((RANDOM % 10000))
done
echo "Введите своё четырёхзначное число:"
read numb
until [[ "$numb" -gt "999" && "$numb" -le "9999" ]] #пока не >999 и <=9999
do
  echo "Ваше число не четырёхзначное. Введите снова:"
  read numb
done
n1=$(($rand % 10)) #цифра числа rand
n2=$(($numb % 10)) #цифра числа numb
i=0
mod=100
div=10
while [ "$i" -lt "4" ] #пока i<4
do
  if [ $n1 -eq $n2 ] #если 2 разряда совпали
  then
	count=$(( $count + 1 ))
  fi
  i=$(( $i + 1 ))
  n1=$((( $rand % $mod ) / $div))
  n2=$((( $numb % $mod ) / $div ))
  mod=$(( $mod * 10 ))
  div=$(( $div * 10 ))
done
echo -n "Кол-во совпадающих позиций: "
echo $count
echo -n "Выбранное рандомное число: "
echo $rand
