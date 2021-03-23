#! /bin/bash
# Exercicis funcions

















#Validar rep 1 arg
#Validar existeix usuari
# mostrar camp a camp
#CONSTANTS
ERR_NARGS=1
ERR_NOLOGIN=2
function showuser_classe(){
  #validar arguments
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 nota"
      return $ERR_NARGS
  fi

  #validar existeix login
  egrep "^$1:" /etc/passwd > /dev/null
  if [ $? -ne 0 ]
  then
    echo "L'usuari $1 no existeix"
    echo "Usage: $0 nota"
    return $ERR_NOLOGIN
    fi
    #mostrar
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
	return 0
}



