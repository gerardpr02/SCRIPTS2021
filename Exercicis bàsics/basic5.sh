#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Mostrar entrada estandard retallant nomes els primers 50 caràcters
# $prog
# acció --> stdin retallant els primers 50 char
#-----------------------------------------------------------------
# CONSTANTS:
OK=0

# 1) XIXA:
while read -r line
do
  echo $line | cut -c1-50
done

exit $OK
