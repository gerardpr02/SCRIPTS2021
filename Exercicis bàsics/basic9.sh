#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Fer un programa que rep per stdin noms d’usuari (un per línia), si existeixen en el sistema (en el fitxer /etc/passwd) 
#mostra el nom per stdout. Si no existeix el mostra per stderr.
# $prog
#-----------------------------------------------------------------
# CONSTANTS
OK=0


#Xixa
while read -r line
do	
  grep "^$line:" /etc/passwd &> /dev/null
  if [ $? -eq 0 ]; then
    echo "Usuari: $line"
  else
    echo "L'usurari $line no existeix!" >> /dev/stderr
  fi	  
done
exit $OK
