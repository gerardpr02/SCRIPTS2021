#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
#  Fer un programa que rep com a argument noms d’usuari, si existeixen en el sistema (en el fitxer /etc/passwd) 
# mostra el nom per stdout. Si no existeix el mostra per stderr.
# $prog user
#-----------------------------------------------------------------
# CONSTANTS
ERR_NARGS=1
OK=0

# 1) Validem args:
if [ $# -lt 1 ]
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 usuari [...]"
  exit $ERR_NARGS
fi


#Xixa
for usuari in $*
do	
  grep "^$usuari:" /etc/passwd &> /dev/null
  if [ $? -eq 0 ]; then
    echo "Usuari: $usuari"
  else
    echo "L'usurari $usuari no existeix!" >> /dev/stderr
  fi	  
done
exit $OK


