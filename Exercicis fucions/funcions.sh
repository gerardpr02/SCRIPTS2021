#! /bin/bash
# Exercicis funcions


#7- Donat un gname mostrar el llistat dels usuaris que tenen aquest grup com a grup
# principal. Com a llistat mostrar el login, uid, dir i shell dels usuaris (en un format
#de llistat del grep). Validar que es rep un argument i que el gname és vàlid.
function showGroupMainMembers_gname(){
 #CONSTANTS:
 ERR_NARGS=1
 ERR_NOGNAME=2
  #validar arguments
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 gname"
      return $ERR_NARGS
  fi
  #validar existeix gname
  line=""
  line=$(egrep "^$1:" /etc/group 2> /dev/null)
  if [ -z "$line" ]
  then
    echo "El gname $1 no existeix"
    echo "Usage: $0 gname"
    return $ERR_NOGNAME
    fi
    #mostrar
    gid=$(egrep "^$1:" /etc/group | cut -d: -f3)
    login=$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1)
    uid=$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f3)
    dir=$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f6)
    shell=$(egrep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f7)

    echo "$login:$uid:$dir:$shell"
        return 0
}




#6- Mostra la informació del usuari tal i com feia showUser o showUserList però
#processa l’entrada estàndard. Cada línia de l’entrada és un login.
showUserIn_fileIn(){
 #CONSTANTS:
 ERR_NARGS=1

  #validar existeix login
  while read -r logins
  do
    egrep "^$logins:" /etc/passwd > /dev/null
    if [ $? -ne 0 ]
    then
      echo "L'usuari $logins no existeix" >> /dev/stderr
    else
      #mostrar
      login=$(egrep "^$logins:" /etc/passwd | cut -d: -f1)
      passwd=$(egrep "^$logins:" /etc/passwd | cut -d: -f2)
      uid=$(egrep "^$logins:" /etc/passwd | cut -d: -f3)
      gid=$(egrep "^$logins:" /etc/passwd | cut -d: -f4)
      gecos=$(egrep "^$logins:" /etc/passwd | cut -d: -f5)
      dir=$(egrep "^$logins:" /etc/passwd | cut -d: -f6)
      shell=$(egrep "^$logins:" /etc/passwd | cut -d: -f7)
      gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
      echo "Login de l'usuari: $login"
      echo "Password de l'usuari: $passwd"
      echo "Uid de l'usuari: $uid"
      echo "Gid de l'usuari: $gid"
      echo "GECOS de l'usuari: $gecos"
      echo "Home de l'usuari: $dir"
      echo "Shell de l'usuari: $shell"
      echo "Gname de l'usuari: $gname"
    fi
done
return 0
}



#5- Realitza el mateix que la funció showUser però processa n lògins que rep com a
#argument. Validar que el login és vàlid i que n’hi ha almenys un.
#Atenció, feu tot el codi de nou, sense cridar per res la funció showUser.
showUsersList_login(){
 #CONSTANTS:
 ERR_NARGS=1
 ERR_NOLOGIN=2
 #validar arguments
  if [ $# -lt 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 login"
      return $ERR_NARGS
  fi

  #validar existeix login
  for logins in $*
  do
    egrep "^$logins:" /etc/passwd > /dev/null
    if [ $? -ne 0 ]
    then
      echo "L'usuari $logins no existeix" >> /dev/stderr
    else
      #mostrar
      login=$(egrep "^$logins:" /etc/passwd | cut -d: -f1)
      passwd=$(egrep "^$logins:" /etc/passwd | cut -d: -f2)
      uid=$(egrep "^$logins:" /etc/passwd | cut -d: -f3)
      gid=$(egrep "^$logins:" /etc/passwd | cut -d: -f4)
      gecos=$(egrep "^$logins:" /etc/passwd | cut -d: -f5)
      dir=$(egrep "^$logins:" /etc/passwd | cut -d: -f6)
      shell=$(egrep "^$logins:" /etc/passwd | cut -d: -f7)
      gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
      echo "Login de l'usuari: $login"
      echo "Password de l'usuari: $passwd"
      echo "Uid de l'usuari: $uid"
      echo "Gid de l'usuari: $gid"
      echo "GECOS de l'usuari: $gecos"
      echo "Home de l'usuari: $dir"
      echo "Shell de l'usuari: $shell"
      echo "Gname de l'usuari: $gname"
    fi
done
return 0
}



#4-Modificar la funció showUser feta anteriorment per fer que mostri també el gname
#de l’usuari.
function showUser_login2(){
 #CONSTANTS:
 ERR_NARGS=1
 ERR_NOLOGIN=2 
 #validar arguments
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 login"
      return $ERR_NARGS
  fi

  #validar existeix login
  egrep "^$1:" /etc/passwd > /dev/null
  if [ $? -ne 0 ]
  then
    echo "L'usuari $1 no existeix"
    echo "Usage: $0 login"
    return $ERR_NOLOGIN
    fi
    #mostrar
    login=$(egrep "^$1:" /etc/passwd | cut -d: -f1)
    passwd=$(egrep "^$1:" /etc/passwd | cut -d: -f2)
    uid=$(egrep "^$1:" /etc/passwd | cut -d: -f3)
    gid=$(egrep "^$1:" /etc/passwd | cut -d: -f4)
    gecos=$(egrep "^$1:" /etc/passwd | cut -d: -f5)
    dir=$(egrep "^$1:" /etc/passwd | cut -d: -f6)
    shell=$(egrep "^$1:" /etc/passwd | cut -d: -f7)
    gname=$(egrep "^[^:]*:[^:]*:$gid:" /etc/group | cut -d: -f1)
    echo "Login de l'usuari: $login"
    echo "Password de l'usuari: $passwd"
    echo "Uid de l'usuari: $uid"
    echo "Gid de l'usuari: $gid"
    echo "GECOS de l'usuari: $gecos"
    echo "Home de l'usuari: $dir"
    echo "Shell de l'usuari: $shell"
    echo "Gname de l'usuari: $gname"
        return 0
}


#3- Rebut un gname per argument mostrar camp a camp les dades del grup (etiqueta
#i valor del camp). Validar que es rep almenys un argument. Validar que és un
#gname vàlid.
function showGroup_gname(){
 #CONSTANTS:
 ERR_NARGS=1
 ERR_NOGNAME=2
  #validar arguments
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 gname"
      return $ERR_NARGS
  fi
  #validar existeix gname
  egrep "^$1:" /etc/group > /dev/null
  if [ $? -ne 0 ]
  then
    echo "El gname $1 no existeix"
    echo "Usage: $0 gname"
    return $ERR_NOGNAME
    fi
    #mostrar
    gname=$(egrep "^$1:" /etc/group | cut -d: -f1)
    passwd=$(egrep "^$1:" /etc/group | cut -d: -f2)
    gid=$(egrep "^$1:" /etc/group | cut -d: -f3)
    uid=$(egrep "^$1:" /etc/group | cut -d: -f4)

    echo "Gname: $gname"
    echo "Password: $passwd"
    echo "Gid: $gid"
    echo "Uid: $gid"
        return 0
}


#1- Rebut un login per argument mostrar camp a camp les dades de l’usuari (etiqueta
#i valor del camp). Validar que es rep almenys un argument. Validar que és un
#login vàlid.
function showUser_login(){
 #CONSTANTS:
 ERR_NARGS=1
 ERR_NOLOGIN=2
  #validar arguments
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 login"
      return $ERR_NARGS
  fi

  #validar existeix login
  egrep "^$1:" /etc/passwd > /dev/null
  if [ $? -ne 0 ]
  then
    echo "L'usuari $1 no existeix"
    echo "Usage: $0 login"
    return $ERR_NOLOGIN
    fi
    echo "L'usuari $1 existeix"
}


#Validar rep 1 arg
#Validar existeix usuari
# mostrar camp a camp
function showuser_classe(){
 #CONSTANTS:
 ERR_NARGS=1
 ERR_LOGIN=2
  #validar arguments
  if [ $# -ne 1 ]
    then
      echo "Error: #arguments incorrectes"
      echo "Usage: $0 login"
      return $ERR_NARGS
  fi

  #validar existeix login
  egrep "^$1:" /etc/passwd > /dev/null
  if [ $? -ne 0 ]
  then
    echo "L'usuari $1 no existeix"
    echo "Usage: $0 login"
    return $ERR_NOLOGIN
    fi
    #mostrar
    login=$(egrep "^$1:" /etc/passwd | cut -d: -f1) 
    passwd=$(egrep "^$1:" /etc/passwd | cut -d: -f2)
    uid=$(egrep "^$1:" /etc/passwd | cut -d: -f3)
    gid=$(egrep "^$1:" /etc/passwd | cut -d: -f4)
    gecos=$(egrep "^$1:" /etc/passwd | cut -d: -f5)
    dir=$(egrep "^$1:" /etc/passwd | cut -d: -f6)
    shell=$(egrep "^$1:" /etc/passwd | cut -d: -f7)

    echo "Login de l'usuari: $login"
    echo "Password de l'usuari: $passwd"
    echo "Uid de l'usuari: $uid"
    echo "Gid de l'usuari: $gid"
    echo "GECOS de l'usuari: $gecos"
    echo "Home de l'usuari: $dir"
    echo "Shell de l'usuari: $shell"
	return 0
}



