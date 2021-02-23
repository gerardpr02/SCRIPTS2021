#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Mostrar entrada estandard retallant nomes els primers 50 caràcters
# $prog
# acció --> stdin retallant els primers 50 char
#-----------------------------------------------------------------
while read -r line
do
  echo "$line" | cut -c50
done
exit 0
