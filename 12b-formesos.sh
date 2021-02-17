#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Validar mesos
# $prog mes[...]
# - rep 1 o mes arguments
# - validar que el mes pren valor [1-12]
# - per cada mes dir numero de dies
# 1) validar arguments
# 2) iterar per cada element --> 2a) Validar que mes pren valor valid [1-12] 2b) determinar valor
#------------------------------------------------------------------
ERR_NARGS=1
ERR_VALOR=2
OK=0
# 1) Validem arguments
if [ $# -lt 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 mes[...]"
        exit $ERR_NARGS
fi



error=1
# bucle for
for mes in $*
do
	# 2a) Validar mes pren valor valid [0,10]
	if ! [ $mes -ge 1 -a $mes -le 12 ]
	then
		echo "Error: Valor del mes $mes no vàlid [1-12]" >> /dev/stderr
	# 2b) determinar valor
	case $mes in 
	1|3|5|7|9|11)
		echo "El mes $mes té 31 dies" ;;
	4|6|8|10)
		echo "El mes $mes té 30 dies" ;;
	2) 
		echo "El mes $mes té 28 dies" ;;
	*)
		echo "Una altre cosa" ;;
done
exit $OK
