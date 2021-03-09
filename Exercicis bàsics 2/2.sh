#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 2) Processar els arguments i comptar quantes n’hi ha de 3 o més caràcters.
# $prog arg[...]
#-----------------------------------------------------------------
#Variables
num=0

#Xixa
for args in $*
do
	echo $args | egrep '.{3,}' &> /dev/null
	if [ $? -eq 0 ]
	then 
		num=$((num+1))
	fi
done
echo "Hi ha $num arguments de 3 o més caràcters."
exit 0

