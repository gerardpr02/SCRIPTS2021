#! /bin/bash
# @edt Gerard Pujol ASIX-M01
# Abril 2021
# Exercicis discs
#$ prog login
#------------------------------------------------------------


#10-LLista per a cada fstype que existeix al fstab (per ordre lexicogràfic)
#les entrades d'quest tipus. Llistar tabuladament el device i el mountpoint.
function allfstype(){
	llista_fstype=$(egrep -v "^#|^$" /etc/fstab  | tr -s '[:blank:]' ':' | cut -d: -f3)
	for type in $llista_fstype
	do
	  fstype $type
	done
}

#9-Donat un fstype llista el device i el mountpoint (per odre de device)
#de les entrades de fstab d'quest fstype.
function fstype(){
	fs=$1
	echo -e "\nFsType: $type"
	echo "Device:"
	egrep -v "^#|^$" /etc/fstab  | tr -s '[:blank:]' ':' | egrep "^[^:]*:[^:]*:$fs:" | sort -k1 -t: | cut -d: -f1 | sed -r 's/^(.*)$/\t\1/'
	echo "MountPoint:"
	egrep -v "^#|^$" /etc/fstab  | tr -s '[:blank:]' ':' | egrep "^[^:]*:[^:]*:$fs:" | sort -k1 -t: | cut -d: -f2 | sed -r 's/^(.*)$/\t\1/'

}
	
#4-Rep com a argument un file o res (en aquest cas es processa stdin). El fitxer o stdin contenen un lògin per línia.
#Mostrar l'ocupació de disc del home de l'usuari. Verificar els arguments rebuts. verificar per cada login
#rebut que és vàlid.
function loginboth(){
	file=/dev/stdin
	if [ $# -eq 1 ]
	then
	  file=$1
	fi
	
	while read -r login
	do
	  fsize $login
    done < $file
	
}

#3-Rep com a argument un nom de fitxer que conté un lògin per línia. Mostrar l'ocupació de disc de cada
#usuari usant fsize. Verificar que es rep un argument i que és un regular file.
function loginfile(){
	if [ $# -ne 1 ]
	then
	  echo "Error: nº d'arguments no vàlid"
	  echo "Usage: $0 login[...]"
	  return 1
	fi
	file=$1
	if ! [ -f $file ]
	then
	  echo "Error: L'argument $file no és un file" 
	  return 1
	fi
	
	while read -r login
	do
	  fsize $login
    done < $file
	
}



#2-Aquesta funció rep logins i per a cada login es mostra l'ocupació de disc del home de l'usuari usant fsize.
#Verificar que es rep almenys un argument. Per a cada argument verificar si és un login vàlid, si no
#generra una traça d'error.
function loginargs(){
	if [ $# -lt 1 ]
	then
	  echo "Error: nº d'arguments no vàlid"
	  echo "Usage: $0 login[...]"
	  return 1
	fi
	
	for login in $*
	do
      fsize $login
	done	
}

#1-Donat un login calcular amb du l'ocupació del home de l'usuari. Cal obtenir el home del /etc/passwd. 
# Verificar si és o no un login vàlid.
function fsize(){
  login=$1
  home=$(egrep "^$login:" /etc/passwd | cut -d: -f6)
  if [ -z $home ]
  then
    echo "Error: Login $login no existeix" > /dev/stderr
    return 1
  fi
  du -h -s $home 2> /dev/null
  return 0
}

