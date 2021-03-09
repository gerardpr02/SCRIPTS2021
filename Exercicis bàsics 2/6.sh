#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 6) Processar per stdin linies d’entrada tipus “Tom Snyder” i mostrar per stdout la línia en format → T. Snyder.
# prog.sh 
#-----------------------------------------------------------------

# Xixa
while read -r line
do
  echo $line | egrep "^[A-Z]{1}[a-z]{1,} [A-Z]{1}[a-z]{1,}$" >> /dev/null
  if [ $? -eq 0 ]
  then
    nom=$(echo $line | cut -c1)
    cognom=$(echo $line | cut -d" " -f2)
    echo "$nom. $cognom"
  fi
done
exit 0
