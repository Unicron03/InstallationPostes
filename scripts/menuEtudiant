#!/bin/bash
clear
run=true
while $run
do
echo
echo -e "---\e[1;43mMenu Etudiant\e[0m---------------------------"
echo -e "\e[1;32m1\e[0m: Créer un cours"
echo -e "\e[1;32m2\e[0m: Supprimer un cours"
echo -e "\e[1;32m3\e[0m: Rechercher fichiers"
echo -e "\e[1;32m0\e[0m: Sortir"
read -p "---Choix : " choix
clear
case $choix
in 0)
echo -e "\e[1;31mAu revoir !\e[0m"
echo
run=false
;;
1)
echo -n "Nom du nouveau cours : "
read rep
if [ -d "$rep" ]
then
    echo ">> Le répertoire $rep existe déjà."
else
    mkdir $rep
    echo ">> Le cours $rep à était créé avec succés."
    mkdir $rep/semestre1
    mkdir $rep/semestre2
    mkdir $rep/semestre1/TD
    mkdir $rep/semestre1/TP
    mkdir $rep/semestre1/CM
    mkdir $rep/semestre2/TD
    mkdir $rep/semestre2/TP
    mkdir $rep/semestre2/CM
fi
;;
2)
echo -n "Nom du cours à supprimer : " 
read rep
if [ -d "$rep" ]
then
    rm -rf $rep
    echo ">> Le cours $rep à était supprimé avec succés."
else
    echo ">> Le cours $rep n'existe pas."
fi
;;
3)
echo -n "Mot à rechercher : "
read mot
echo ">>"
find . -type f -exec du -Sh {} + | sort -rh | head -n 3 | grep $mot
;;
*)
echo ">> Choix non proposé"
;;
esac
done
