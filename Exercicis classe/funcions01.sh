#! /bin/bash
# Exemples de funcions


#Validar rep 1 arg
#Validar existeix usuari
# mostrar camp a camp

function showuser(){
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 nota"
      return 1
  fi

  egrep "^$1:" /etc/passwd > /dev/null
  if [ $? -eq 0 ]
  then
    login=$(egrep $1 /etc/passwd | cut -d: -f1) 
    passwd=$(egrep $1 /etc/passwd | cut -d: -f2)
    uid=$(egrep $1 /etc/passwd | cut -d: -f3)
    gid=$(egrep $1 /etc/passwd | cut -d: -f4)
    gecos=$(egrep $1 /etc/passwd | cut -d: -f5)
    dir=$(egrep $1 /etc/passwd | cut -d: -f6)
    shell=$(egrep $1 /etc/passwd | cut -d: -f7)

    echo "Login de l'usuari: $login"
    echo "Password de l'usuari: $passwd"
    echo "Uid de l'usuari: $uid"
    echo "Gid de l'usuari: $gid"
    echo "GECOS de l'usuari: $gecos"
    echo "Home de l'usuari: $dir"
    echo "Shell de l'usuari: $shell"

  else

    echo "L'usuari $1 no existeix"
    return 1
  fi
}


function suma(){
  echo  "La suma és: $(($1+$2))"
  return 0
}

function dia(){
  date
  return 0
}




