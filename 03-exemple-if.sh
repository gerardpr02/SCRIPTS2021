#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Exemple if
 $ prog edat
# -------------------------------------------
if [ $# -ne 1];
	echo "Error: nºarguments incorrecte"
	echo "Usage: $0 edat"
	exit 1
fi

echo $1
exit 0
