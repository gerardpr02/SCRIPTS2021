#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Rebre directori i fer ls del directori
# $prog dir
# acció --> ls dir
#-----------------------------------------------------------------

ERR_NARGS=1
ERR_NODIR=2
# 1) Validem arguments
if [ $# -ne 1 ]
then
        echo "Error: #arguments incorrectes"
        echo "Usage: $0 dir"
        exit $ERR_NARGS
fi

# 2) Saber si es directori
mydir=$1
if ! [ -d $mydir ]; 
then
  echo "Error: $mydir no és un directori"
  echo "Usage: $0 dir"
  exit $ERR_NODIR
fi

# 3) Xixa
llista=$(ls $mydir)
for fit in $llista
do
  if [ -h $mydir/$fit ]; then 
    echo "$fit és un symbolic link"
  elif [ -f $mydir/$fit ]; 
  then
    echo "$fit és un regular file "
  elif [ -d $mydir/$fit ]; then
    echo "$mydir/$fit és un directori"
  else
    echo "$fit és una altra cosa"
  fi
done
exit 0
