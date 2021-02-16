#! /bin/bash
# @edt ASIX 2020 - 2021
# Exemples case
# -----------------------

# 3) dl dt dc dj dv ds dm
case $1 in
  "dl"|"dt"|"dc"|"dj"|"dv")
    echo "es laborable";;
  "ds"|"dm")
    echo "es festiu";;
  *)
    echo "es una altre cosa";;
esac    
exit 0


# 2) vocals i consonants
case $1 in
  [aeiou])
    echo "es una vocal";;
  [bcdfghjklmnpqrstvwxyz])
    echo " es una consonant";;
  *)
    echo "es una altre cosa";;
esac
exit 0

# 1) exemple noms
case $1 in
  "pere"|"pau"|"joan")
     echo "es un nen";;
  "marta"|"anna"|"julia")
     echo "es una nena"
     ;;
  *)
    echo "indefinit";;
esac
exit 0 
  
