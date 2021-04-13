#! /bin/bash
# Exemples de funcions



function creaEscola(){
  for classe in $*
  do
    creaClasse $classe
  done



}


function creaClasse(){
  classe=$1
  PASSWD="alum"
  llista_noms=$(echo ${classe}{01..02})
  for user in $llista_noms
  do
    useradd $user
    #echo "alum" | passwd --stdin $user &> /dev/null
    #chpasswd < file
    echo "$user:$PASSWD" | chpasswd 
  done

 
}


function showAllGroups(){
  MIN_USERS=2
  llista_gids=$(cut -d: -f4 /etc/passwd | sort -n | uniq)
  for gid in $llista_gids
  do
    count=$(egrep  "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | wc -l)	
    gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
    if [ $count -ge $MIN_USERS ]
    then
    gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1) 
    echo "$gname($gid):$count"
    egrep  "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | sort | cut -d: -f1,3,7 | sed -r 's/^(.*)$/\t\1/'
    fi 

  done
  return 0
}


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


 

