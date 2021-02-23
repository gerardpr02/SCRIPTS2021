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
# CONSTANTS
ERR_NARGS=1
OK=0

# 1) Validem que hi ha un argument:
if [ $# -ne 1 ]
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 mes"
  exit $ERR_NARGS
fi

# 2) Xixa:
llista_mes=$1
for mes in $llista_mes
do
  if ! [ $mes -ge 1 -a $mes -le 12 ]
  then
     echo "ERROR: Valor de l'argument no vàlid." >> /dev/stderr
     echo "Usage: $0 mes (valor de l'1 al 12)." >> /dev/stderr
  fi
  case $mes in
      "2")
        dies=28;;
      "4"|"6"|"9"|"11")
        dies=30;;
      *)
        dies=31;;
  esac
done

echo "El mes: $mes, te $dies díes."
exit $OK
