#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# Copiar fitxer a directori desti
#- validar rep args , validar que existeix fit i dir i validar que es tipus file o tipus dir, copiar fit a dir
#$ prog file[...] dir
# -------------------------------------------------------------

#Constants
ERR_NARGS=1
ERR_FILE=2
ERR_DIR=3

# Validar numero d'args
if [ $# -lt 2 ]
then
   echo "Error: Numero d'arguments incorrecte"
   echo "Usage: $0 file[...] dir"
   exit $ERR_NARGS
fi

# Variables
fit=$1
dir=$2
ultim_arg=$(($#-1))

# Mostrar num d'args
echo "El numero d'arguments és $#"

# Mostrar llista d'arguments
echo "La llista d'arguments és $*"

# Mostrar últim argument
echo "L'ultim argument és: " 
echo "AMB SED:"
echo $* | sed 's/^.* //'
echo "AMB CUT:"
echo $* | cut -f$# -d' '

# Mostrar llista de files
echo "La llista de files és:" 
	echo "AMB SED:"
echo $* | sed 's/ [^ ]*$//'
echo "AMB CUT:"
echo $* | cut -f1-$(($#-1)) -d' '

exit 0















