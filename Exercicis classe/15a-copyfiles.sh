#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Copiar fitxer a directori desti
#- validar rep dos args , validar que existeix fit i dir i validar que es tipus file o tipus dir, copiar fit a dir
#$ prog file dir
# -------------------------------------------------------------

#Constants
ERR_NARGS=1
ERR_FILE=2
ERR_DIR=3

# Validar numero d'args
if [ $# -ne 2 ]
then
   echo "Error: Numero d'arguments incorrecte"
   echo "Usage: $0 fit dir"
   exit $ERR_NARGS
fi

# Variables
fit=$1
dir=$2

#Validar que arg1 es tipus file
if [ ! -e $fit ]
then
  echo "Error: El fitxer $fit no existeix!"
  echo "Usage: $0 fit dir"
  exit $ERR_FILE
fi

#Validar que arg2 es tipus dir
if [ ! -d $dir ]
then
  echo "Error : L'argument $dir no és un directori!"
  echo "Usage: $0 fit dir"
  exit $ERR_DIR
fi

#Xixa
cp $fit $dir
exit 0

