#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Febrer 2021
#Vull posar opcions y arguments , pero algunes de les opcions porten associat un valor
#
#$ prog [-a file -b -c bnum -e] arg[...]
# -------------------------------------------------------------

#Constants



#Variables
opcions=''
args=''
file=''
min=''
max=''

#Validar args

#Xixa
while [ -n "$1" ]
do
  case $1 in
  -[bce])
    opcions="$opcions $1";;
  -a)
    file=$2
    shift;;
  -d)
    min=$2
    max=$3
    shift
    shift;;
  *)
    args="$args $1";;
  esac
  shift
done
echo "File: $file"
echo "Min: $min"
echo "Max: $max"
echo "Opcions: $opcions"
echo "Arguments: $args"
exit 0
