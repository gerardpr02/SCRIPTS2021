#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 3) Processar arguments que són matricules: 
# a) llistar les vàlides, del tipus: 9999-AAA. 
# b) stdout les que són vàlides, per stderr les no vàlides. Retorna de status el número d’errors (de no vàlides)
# prog.sh matricula[...]
#-----------------------------------------------------------------
#Constants
status=0


#Xixa
for matr in $*
do
  echo $matr | egrep '^[0-9]{4}-[A-Z]{3}$'
  if [ $? -ne 0 ]
  then
    echo "Error: La matricula $matr no és vàlida" >> /dev/stderr
    ((status++))
  fi
done
exit $status
