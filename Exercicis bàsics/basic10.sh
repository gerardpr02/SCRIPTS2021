#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Fer un programa que rep com a argument un número indicatiu del número màxim de línies a mostrar. 
#El programa processa stdin línia a línia i mostra numerades un màxim de num línies.
# $prog num
#-----------------------------------------------------------------
# CONSTANTS
ERR_NARGS=1
OK=0

# 1) Validem args:
if [ $# -lt 1 -o $# -gt 1 ]
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 numero"
  exit $ERR_NARGS
fi

contador=1
MAX=$1
while read -r line
do	
  if [ "$contador" -le $MAX ]
  then
    echo "$contador: $line"
  else
    echo "$line"      	  
  fi	  
  ((contador++))
done
