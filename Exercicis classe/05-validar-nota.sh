#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Indica nota : Mostrar si esta aprovat/suspes 
#  - validar rep un argument 
#  $ prog nota
# --------------------------------------------------------------
ERR_NARGS=1
ERR_VALOR=2
# 1) Validem arguments
if [ $# -ne 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 nota"
        exit $ERR_NARGS
fi

# 2) Validar nota pren valor valid [0,10]
nota=$1
if ! [ $nota -ge 0 -a $nota -le 10 ] 
then
	echo "Error: nota no vàlida"
	echo "Usage: nota del [0-10]"
	exit $ERR_VALOR
fi

# Xixa
if [ $nota -ge 5 ]
then
	echo "Nota: $nota ,has aprovat"
else
	echo "Nota: $nota ,has suspès"
fi
exit 0

