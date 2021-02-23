#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Exemple if : Indica si és major d'edat
# $ prog arg1
# -------------------------------------------
# 1) Validem arguments
if [ $# -ne 1 ]
then
	echo "Error: #arguments incorrecte"
	echo "Usage: $0 edat"
	exit 1
fi

#Xixa
edat=$1
if [ $edat -ge 18 ]
then
	echo "Edat $edat major d'edat"
fi
exit 0