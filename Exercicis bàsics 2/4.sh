#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 4) Processar stdin mostrant per stdout les línies numerades i en majúscules..
# prog.sh 
#-----------------------------------------------------------------


#Variables
num=1

# Xixa
while read -r line
do
 echo "$num:$line" | tr '[:lower:]' '[:upper:]'
 ((num++))
done

exit 0
