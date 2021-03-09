#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 5) Processar stdin mostrant per stdout les línies de menys de 50 caràcters.
# prog.sh 
#-----------------------------------------------------------------

# Xixa
while read -r line
do
  char=$(echo $line | wc -c)
  if [ $char -lt 50 ]
  then
    echo $line
  fi
done
exit 0
