#! /bin/bash
# isx46493081 ASIX-M01
# Febrer 2021
# Rebre directori [...]
# $ prog dir
# validar 1 arguments
# llistar el directori si existeix
# ------------------------------
ERR_NARGS=1
ERR_NODIR=2
status=0
# 1) Validar argument:
if [ $# -lt 1 ]
then
  echo "ERROR: num arg incorrecte"
  echo "Usage: $0 dir"
  exit $ERR_NARGS
fi

# Validar si es un directori
for mydir in $*
do
  if ! [ -d $mydir ]
  then
    echo "ERROR: $mydir no és un directori" >> /dev/stderr
    status=$ERR_NODIR
  else
    echo "Directori: $mydir"
    llista_elements=$(ls  $mydir)
    for fit in  $llista_elements
    do
      if [ -h $mydir/$fit ]
      then 
        echo -e "\t $fit es un link"	  
      elif [ -f $mydir/$fit ]
      then
        echo -e "\t $fit es un regular file"
      elif [ -d $mydir/$fit ]
      then 
        echo -e "\t $fit Es un directori"
      else
        echo -e "\t $fit es una altra  cosa"
      fi
    done
  fi  
done
exit $status
