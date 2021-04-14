#! /bin/bash
# @edt ASIX-M01 Gerard Pujol
# Abril 2021
#
#
MIN=$1

if [ -z $1 ] 
then
  MIN=5
fi


llista_shell=$(cut -d: -f7 /etc/passwd | uniq)
for shells in $llista_shell
do
  login=$(cut -d: -f1 /etc/passwd)
  count=$(egrep "^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:$shells$" /etc/passwd | wc -l)
  if [ $count -ge $MIN ]
  then
    echo "$shells($count)"
    egrep ":$shells:$" /etc/passwd | cut -d: -f1 | sort -k7,7 | sed -r 's/^(.*)$/\t\1/'
    egrep "^$login:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:$shells$" /etc/passwd | cut -d: -f1 | sort -k7,7 | sed -r 's/^(.*)$/\t\1/'
  fi
done
