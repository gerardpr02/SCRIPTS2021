#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Exemples
# $prog 
#-----------------------------------------------------------------

# 3)
while [ $# -gt 0 ]
do
	echo "$#: $*"
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
