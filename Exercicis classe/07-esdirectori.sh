#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# llistar directori si existeix
#- validar rep un argument , validar que es directori, si es el llistem , si no error.
#  $ prog dir
# --------------------------------------------------------------
ERR_NARGS=1
ERR_NODIR=2
# 1) Validem arguments
if [ $# -ne 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 dir"
        exit $ERR_NARGS
fi

# 2) Saber si es directori
mydir=$1
if ! [ -d $mydir ]; 
then
  echo "Error: $mydir no és un directori"
  echo "Usage: $0 dir"
  exit $ERR_NODIR
fi

# Xixa
ls $mydir
exit 0
