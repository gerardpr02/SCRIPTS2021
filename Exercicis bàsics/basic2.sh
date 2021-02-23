#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Mostrar arguments rebuts linia a linia , tot numerant-los
# $prog arg
# acció --> mostrar args
#-----------------------------------------------------------------
contador=1
for arg in $*
do
	echo $contador: $arg
	((contador++))
done
