#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 8) Programa: prog file…
#   a)Validar existeix almenys un file. Per a cada file comprimir-lo. Generar per stdout el nom del file comprimit si s’ha comprimit correctament, o un missatge d’error per stderror si no s’ha pogut comprimir. En finalitzar es mostra per stdout quants files ha comprimit. 
#     Retorna status 0 ok, 1 error nº args, 2 si algun error en comprimir.
#   b) Ampliar amb el cas: prog -h|--help.
# prog.sh file[...]
#-----------------------------------------------------------------

#Constants
status=0

#Variables
contador=0

#Validar args
if [ $# -lt 1 ]
then
  echo "Error: nº d'arguments no vàlid"
  echo "Usage: $0 file[...]"
  status=1
  exit $status
fi


#Ajuda -h
if [ $1 = "-h" ]
then
  echo "Ajuda del programa $0"
  echo "$0 file[...] --> comprimir 1 o més files (per separat)"
  echo "$0 -h --> Mostra aquesta ajuda"
  exit $status
fi

#Xixa
for file in $*
do
  if [ -e $file ]
  then
    tar czf "$file.tgz" $file 
    echo "File $file comprimit"
    ((contador++))
  else
    echo "Error: Error al comprimir el file $file" >> /dev/stderr
    status=2
  fi  
done
echo "Files Comprimits : $contador"
exit $status
