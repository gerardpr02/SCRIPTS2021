#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Fer contador des de zero fins al valor indicat per l'argument
# $prog num
# acció --> mostrar de 0 a num
#-----------------------------------------------------------------
ERR_NARGS=1
# 1) Validem arguments
if [ $# -gt 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 dir"
        exit $ERR_NARGS
fi


MAX=$1
num=0
while [ $num -le $MAX ]
do
	echo $num
	((num++))
done
exit 0

