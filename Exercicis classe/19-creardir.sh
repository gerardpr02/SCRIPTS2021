#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
# crear
# Crear directoris a partir d'arguments , si es pot crear mostra per stdout OK creat , si no , ho mostra per stderr
#0 tot be , 1 err arg , 2 err al crear algun dir
#$ prog noudir[...]
#------------------------------------------------------------

#Constants
ERR_ARGS=1
status=0

#Validar args
if [ $# -lt 1 ]
then
  echo "Error: nº d'arguments no vàlid"
  echo "Usage: $0 noudir[...]"
  exit $ERR_ARGS
fi


#Xixa
for dir in $*
do
  mkdir -p $dir &> /dev/null 
  if [ $? -eq 0 ]
  then
    echo "Directori $dir creat."
  else
    echo "Error: Error al crear $dir" >> /dev/stderr
    status=2
  fi  
done
exit $status

