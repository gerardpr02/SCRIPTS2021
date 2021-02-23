#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Exemple for
# $prog [args][...]
#--------------------------------------


# 6) Llista numerats tots els logins
login=$(cut -f1 -d: /etc/passwd)
contador=1
for elem in $login
do
	echo $contador: $elem
	((contador++))
done
exit 0

# 5) Llista de noms del fitxer actiu numerats
llista_noms=$(ls)
contador=1
for elem in $llista_noms
do
	echo $contador: $elem
	((contador++))
done
exit 0


# 4) Iterar per cada argument numerat
contador=1
for arg in $*
do
	echo $contador: $arg
	contador=$(($contador+1))
done
exit 0

# 3) Iterar per la llista de noms que genera ls
llista_noms=$(ls)
for elem in $llista_noms
do
	echo $elem
done
exit 0


# 2b) Iterar per cada argument rebut
for arg in "$@"
do
	echo $arg
done
exit 0

# 2) Iterar per cada argument rebut
for arg in $*
do
	echo $arg
done
exit 0

# 1b) Iterar una llista de noms
for nom in "pere marta anna ramon"
do
	echo $nom
done
exit 0

# 1a) Iterar una llista de noms
for nom in "pere" "marta" "anna" "ramon"
do
	echo $nom
done
exit 0
