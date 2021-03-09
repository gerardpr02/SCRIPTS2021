#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 9) Programa: prog.sh [ -r -m -c cognom  -j  -e edat ]  arg…
#   Escriure el codi que desa en les variables: opcions, cognom, edat i arguments els valors corresponents.
#   No cal validar ni mostrar res!
#   Per exemple si es crida: $ prog.sh -e 18 -r -c puig -j wheel postgres ldap
#   retona:     opcions «-r -j», cognom «puig», edat «18», arguments «wheel postgres ldap»
# prog.sh [ -r -m -c cognom  -j  -e edat ]  arg[...]
#-----------------------------------------------------------------

#Constants
ERR_NARGS=1

# Validar numero d'args
if [ $# -lt 2 ]
then
   echo "Error: Numero d'arguments incorrecte"
   echo "Usage: $0 [ -r -m -c cognom  -j  -e edat ]  arg[...]"
   exit $ERR_NARGS
fi

# Variables
opcions=""
edat=""
cognom=""
arguments=""

#Xixa
while [ -n "$1" ]
do
  case $1 in
    "-r"|"-m"|"-j")
    opcions="$opcions $1";;
    -c)
      cognom=$2
      shift;;
    -e)
      edat=$2
      shift;;
    *)
    arguments="$arguments $1";;
  esac
  shift
done
echo "Cognom: $cognom"
echo "Edat: $edat"
echo "Opcions: $opcions"
echo "Arguments: $arguments"
exit 0
