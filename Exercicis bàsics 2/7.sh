#! /bin/bash
# @ edt Gerard Pujol ASIX-M01
# Març 2021
# 7) Programa: prog -f|-d arg1 arg2 arg3 arg4
# a) Valida que els quatre arguments rebuts són tots del tipus que indica el flag. És a dir, si es crida amb -f valida que tots quatre són file. Si es crida amb -d valida que tots quatre són directoris.
#    Retorna 0 ok, 1 error nº args, 2 hi ha elements errònis. 
#    Exemple: prog -f carta.txt a.txt /tmp fi.txt → retorna status 2. 
# b) Ampliar amb el cas: prog -h|--help.
# prog.sh 
#-----------------------------------------------------------------
