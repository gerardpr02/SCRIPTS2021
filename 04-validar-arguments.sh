#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Exemple if : Validar prog té exactament dos args i els mostra
# si no dos args mostra error , usage i exit error
# --------------------------------------------------------------
# 1) Validem arguments
if [ $# -ne 2 ]
then
	echo "Error: #arguments incorrecte"
	echo "Usage: $0 arg1 arg2"
	exit 1
fi

#Xixa
arg1=$1
arg2=$2
echo "Els arguments son: $arg1, $arg2"
exit 0
