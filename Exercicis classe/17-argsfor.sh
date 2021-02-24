#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Ha de dir les opcions i els arguments que s'han entrat 
#validar que rep dos args min 
#$ prog [-a -b -c -d -f -g] arg[...]
# -------------------------------------------------------------

#Constants
ERR_NARGS=1

# Validar numero d'args
if [ $# -lt 2 ]
then
   echo "Error: Numero d'arguments incorrecte"
   echo "Usage: $0 [-a , -b , -c , -d , -f , -g] arg[...]"
   exit $ERR_NARGS
fi

# Variables
opcions=""
arguments=""
for args in $*
do
  case $args in
    "-a"|"-b"|"-c"|"-d"|"-f"|"-g")
    opcions="$opcions $args";;
    *)
    arguments="$arguments $args";;
  esac
done
echo "opcions: $opcions"
echo "arguments: $arguments"
exit 0
