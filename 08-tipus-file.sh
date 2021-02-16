#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# llistar directori si existeix
#- validar rep un argument , validar que es directori, regular file , enllaç , no existeix o es una altre cosa.
#  $ prog dir
# -------------------------------------------------------------
ERR_NARGS=1
ERR_NOEXIST=2
if [ $# -ne 1 ]
then
  echo "Error: num args incorrecte"
  echo "Usage: $0 fit"
  exit $ERR_NARGS
fi
# Xixa
fit=$1
if [ ! -e $fit ]; then
  echo "Error: $fit no existeix"
  exit $ERR_NOEXIST
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
