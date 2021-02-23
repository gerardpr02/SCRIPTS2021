#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
#  Processar línia a línia l’entrada estàndard, si la línia té més de 60 caràcters la mostra, si no no.

# $prog
# acció --> mostrar si un stdin té mes de 60 char
#-----------------------------------------------------------------
while read -r line
do
  contar=$(echo $line | wc -c)
  if [ $contar >=60 ] 
  then
    echo $line
  else
    echo "no val"
  fi
done
exit 0
