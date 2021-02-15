#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# llistar directori si existeix
#- validar rep un argument , validar que es directori, regular file , enllaç , no existeix o es una altre cosa.
#  $ prog dir
# --------------------------------------------------------------
# -------------------------------
# si num args no es correcte plegar
ERR_NARGS=1
if [ $# -ne 1 ]
then
  echo "ERROR: num args incorrecte"
  echo "usage: $0 fit"
  exit $ERR_NARGS
fi
# Xixa
fit=$1
if [ ! -e $fit ]; then
  echo "$fit no existeix"
elif [ -h $fit ]; then 
  echo "$fit és un symbolic link"
elif [ -f $fit ]; then
  echo "$fit és un regular file "
elif [ -d $fit ]; then
  echo "$fit és un directori"
else
  echo "$fit és una altra cosa"
fi
exit 0
