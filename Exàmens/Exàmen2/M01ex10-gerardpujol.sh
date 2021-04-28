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


llista_shell=$(cut -d: -f7 /etc/passwd | sort | uniq)
for shells in $llista_shell
do
  count=$(egrep ":$shells$" /etc/passwd | wc -l)
  login=$(egrep ":$shells$" /etc/passwd | sort -k7,7 | cut -d: -f1 | sed -r 's/^(.*)$/\t\1/' )
  if [ $count -ge $MIN ]
  then
    echo "$shells($count)"
    echo "$login"
    #egrep ":$shells$" /etc/passwd | sort -k7,7 | cut -d: -f1 | sed -r 's/^(.*)$/\t\1/'
  fi
done
