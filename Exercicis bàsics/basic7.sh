#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
#  Processar línia a línia l’entrada estàndard, si la línia té més de 60 caràcters la mostra, si no no.
# $prog
#-----------------------------------------------------------------
while read -r line
do
  contar=$(echo $line | wc -c)
  if [ "$contar" -gt 60 ] 
  then
    echo $line
  fi
done
exit 0
