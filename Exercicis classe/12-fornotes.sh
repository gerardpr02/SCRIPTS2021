#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Validar notes
# $prog notes[...]
# - rep 1 o mes arguments
# - per cada nota [0-10]
# - per cada nota dir si es suspes , aprovat , notable o excellent
# 1) validar arguments
# 2) iterar per cada element --> 2a) Validar nota pren valor valid [0,10] 2b) determinar valor
#------------------------------------------------------------------
ERR_NARGS=1
ERR_VALOR=2
OK=0
# 1) Validem arguments
if [ $# -lt 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 nota[...]"
        exit $ERR_NARGS
fi



error=1
# bucle for
for nota in $*
do
	# 2a) Validar nota pren valor valid [0,10]
	if ! [ $nota -ge 0 -a $nota -le 10 ] 
	then
		echo "Error $error : nota $nota no vàlida [0-10]" >> /dev/stderr
		((error++))
	# 2b) determinar valor
	elif [ $nota -lt 5 ]
	then
		echo "Nota: $nota , has suspès"
	elif [ $nota -lt 7 ]
	then
		echo "Nota: $nota , has aprobat"
	elif [ $nota -lt 9 ]
	then
		echo "Nota: $nota , Notable"
	elif [ $nota -eq 10 ]
	then
		echo "Nota: $nota , Excel.lent"
	fi
done
exit $OK




