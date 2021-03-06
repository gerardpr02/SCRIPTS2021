#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Febrer 2021
# Fer un programa que rep com a arguments noms de dies de la setmana i mostra  quants dies eren laborables i quants festius. Si l’argument no és un dia de la setmana genera un error per stderr.
#  Exemple: $ prog dilluns divendres dilluns dimarts kakota dissabte sunday
# $prog dies [...]
# acció --> mostrar quants dies son laborables o festius
#-----------------------------------------------------------------
# CONSTANTS
ERR_NARGS=1
OK=0

# 1) Validem args:
if [ $# -lt 1 ]
then
  echo "ERROR: nº arguments incorrecte"
  echo "Usage: $0 dia [...]"
  exit $ERR_NARGS
fi


#Xixa
laborables=0
festius=0
for dia in $* 
do
  case $dia in
    "dilluns"|"dimarts"|"dimecres"|"dijous"|"divendres")
       ((laborable++));;
    "dissabte"|"diumenge")
       ((festius++));;
    *)
	   echo "Error: l'argument \"$dia\" no és un dia de la setmana!" >> /dev/stderr;;
  esac
done
echo "Total de dies laborables: $laborables"
echo "Total de dies festius: $festius"
exit $OK



