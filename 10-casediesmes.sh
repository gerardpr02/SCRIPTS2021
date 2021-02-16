#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Dir quants dies tenene els mesos
# $prog mes
#--------------------------------------
ERR_NARG=1
ERR_NORANG=2
# 1)
if [ $# -ne 1 ]
then
  echo "Error: Numero d'arguments invalid"
  echo "Usage: $0 mes"
  exit $ERR_NARG
fi

# 2)
mes=$1
if ! [ $mes -ge 1 -a $mes -le 12 ]
then
  echo "Error: Valor d'rgument no vàlid"
  echo "Usage: $0 mes (valors [1-12])"
  exit $ERR_NORANG
fi

case $mes in 
  1|3|5|7|9|11)
     echo "El mes té 31 dies" ;;
  4|6|8|10)
    echo "El mes té 30 dies" ;;
  2) 
    echo "El mes té 28 dies" ;;
  *)
    echo "Una altre cosa" ;;

esac
exit 0
