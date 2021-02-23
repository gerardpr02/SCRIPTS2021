#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Exemples
# $prog 
#-----------------------------------------------------------------

# 9) Entrada estandard numerada i en majuscules
contador=1
while read -r line
do
  echo "$contador:$line" | tr '[:lower:]' '[:upper:]'
  ((contador++))
done
exit 0

# 8) mostrar entrada estandard i quan escigui "fi" el programa pari
read -r line
while [ "$line" != "FI" ]
do
  echo $line
  read -r line
done
exit 0


# 7) mostar la entrada estandard linia a linia numerades
contador=1
while read -r line
do
  echo "$contador : $line"
  ((contador++))
done
exit 0

# 6) mostrar la entrada estandard linia a linia
while read -r line
do
  echo $line
done
exit 0

# 5)
num=1
while [ "$#" -gt 0 ]
do
  echo "$num: $1, $#, $*"
  ((num++))
  shift
done
exit 0

# 4) 
num=1
while [ -n "$1" ]
do
  echo "$num: $1, $#, $*"
  num=$((num+1))
  shift
done
exit 0

# 3) mostrar els arguments
while [ -n "$1" ]
do
	echo "$1 $#: $*"
	shift
done
exit 0
# 2) mostrar de m a 0 (count down)
MIN=0
num=$1
while [ $num -ge $MIN ]
do
	echo $num
	((num--))
done
exit 0

# 1) mostrar numeros del 1 al 10
MAX=10
num=1
while [ $num -le $MAX ]
do
	echo $num
	((num++))
done
exit 0
