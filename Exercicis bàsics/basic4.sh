#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Fer un programa que rep un mes (un o més) i indicar per a cada mes rebut quants dies té el mes
# $prog mes [...]
# acció --> mostrar quants dies té el mes (o mesos)
#-----------------------------------------------------------------
# CONSTANTS
ERR_NARGS=1
OK=0

# 1) Validem args:
if [ $# -lt 1 ]
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 mes [...]"
  exit $ERR_NARGS
fi

# 2) Xixa:
llista_mes=$*
for mes in $llista_mes
do
  if ! [ $mes -ge 1 -a $mes -le 12 ]
  then
     echo "ERROR: El mes $mes no és vàlid. (valor de 1 a 12)" >> /dev/stderr
  else
    case $mes in
        "2")
          dies=28;;
        "4"|"6"|"9"|"11")
          dies=30;;
        "1"|"3"|"5"|"10"|"12")
          dies=31;;
    esac
    echo "El mes: $mes, te $dies díes."
  fi
done

exit $OK
