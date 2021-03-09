#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 1) Processar els arguments i mostrar per stdout només els de 4 o més caràcters.
# $prog arg[...]
#-----------------------------------------------------------------

for args in $*
do
  echo $args | egrep '.{4,}' 
done
exit 0 
