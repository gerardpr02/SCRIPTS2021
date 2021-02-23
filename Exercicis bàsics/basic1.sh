#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Mostrar entrada estandard numerant linia a linia
# $prog
# acció --> stdin numerada
#-----------------------------------------------------------------
contador=1
while read -r line
do
  echo "$contador:$line"
  ((contador++))
done
exit 0
