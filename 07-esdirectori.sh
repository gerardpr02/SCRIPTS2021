#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# llistar directori
#- validar rep un argument , validar que es directori, si es el llistem , si no error.
#  $ prog arg
# --------------------------------------------------------------
ERR_NARGS=1
ERR_DIR=2
# 1) Validem arguments
if [ $# -ne 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 dir"
        exit $ERR_NARGS
fi

# 2) Saber si es directori
dir=$1
if ! [ -d $dir ]; then
  echo "ERROR: $dir no és un directori"
  echo "Usage: $0 dir"
  exit $ERR_DIR
fi

# Xixa
ls $dir
exit 0