#! /bin/bash
# @ edt ASIX-M01
# isx46493081 Gerard Pujol
# Descripció : Processar arguments (logins) i mostrar total de logins , quants existeixen (stdout) i quants no (stderr).
# $ prog.sh login[...] 
# $ prog.sh --help
#------------------------------------------------------------------------------------------------------------------------

#CONSTANTS
ERR_ARG=1
status=0

# Validar numero d'arguments
if [ $# -lt 1 ]
then
  echo "Error: numero d'arguments no vàlid"
  echo "Usage: $0 login[...]"
  exit $ERR_ARG
fi


# Opcio help
if [ $1 = "--help" ]
then
  echo "Ajuda del programa $0"
  echo "Usage: $0 login[...]"
  exit $status
fi

#Xixa
total=0
exis=0
inexis=0
for login in $*
do
  egrep "$login" /etc/passwd >> /dev/null
  if [ $? -eq 0 ]
  then
    echo "Login $login correcte"
    ((exis++))
  else
    echo "$login" >> /dev/stderr
    ((inexis++))
    status=2
  fi
((total++))
done
echo " Quantitat de logins: $total "
echo " Logins existents: $exis "
echo " Logins inexistents: $inexis "

exit $status
