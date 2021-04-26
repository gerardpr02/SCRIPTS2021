#! /bin/bash
# ASIX-M01 @edt
# Gerard Pujol 
# isx46493081


# El programa pot rebre un fitxer o no rebre res i processar stdin
function exemple_filtrar_2(){
  num=0
  file=/dev/stdin
  if [ $# -eq 1 ]
  then
    $file=$1
  fi

  while read -r line 
  do
    echo "$num:$line"
    ((num++))
  done < $file
}   
      

# Filtrar totes les linies del passwd , i mostra nomes les linies que el seu GID sigui més gran o igual a 500
function exemple_filtrar_GID(){
  if [ $# -ne 1 ]
  then
    echo "error..."
    return 1
  fi

  MAX=500
  file=$1
  while read -r line
  do
    gid=$(echo $line | cut -d: -f4)
    if [ $gid -ge $MAX ]
    then
      echo "$line"
    fi
  done < $file
}


function exemple_llistar(){
  if [ $# -ne 1 ]
  then
    echo "error...."
    return 1
  fi

  file=$1
  contador=1
  while read -r login
  do
    echo $contador:$login
    ((contador++))
  done < $file


}
