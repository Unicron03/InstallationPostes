#!/bin/bash
clear
run=true
while $run
do
echo
echo -e "---\e[1;43mMenu\e[0m---------------------------"
echo -e "\e[1;32m1\e[0m: Affichage répertoire courant"
echo -e "\e[1;32m2\e[0m: Liste des éléments du répertoire"
echo -e "\e[1;32m3\e[0m: Informations sur un fichier"
echo -e "\e[1;32m4\e[0m: Changement de répertoire"
echo -e "\e[1;32m5\e[0m: n premieres lignes d'un fichier"
echo -e "\e[1;32m6\e[0m: Créer un répertoire"
echo -e "\e[1;32m7\e[0m: Supprimer un répertoire"
echo -e "\e[1;32m8\e[0m: Créer un fichier"
echo -e "\e[1;32m9\e[0m: Supprimer un fichier"
echo -e "\e[1;32m10\e[0m: Rechercher un fichier ou un répertoire"
echo -e "\e[1;32m11\e[0m: Copier un fichier ou un répertoire"
echo -e "\e[1;32m12\e[0m: Déplacer un fichier ou un répertoire"
echo -e "\e[1;32m13\e[0m: Compresser un fichier ou un répertoire"
echo -e "\e[1;32m14\e[0m: Décompresser un fichier"
echo -e "\e[1;32m15\e[0m: Afficher l'espace disque utilisé et disponible"
echo -e "\e[1;32m16\e[0m: Afficher les processus en cours"
echo -e "\e[1;32m17\e[0m: Tuer un processus"
echo -e "\e[1;32m0\e[0m: Sortie"
read -p "---Choix : " choix
clear
case $choix
in 0)
echo -e "\e[1;31mAu revoir !\e[0m"
echo
run=false
;;
1)
echo ">>" $(pwd)
;;
2)
echo ">>" $(ls)
;;
3)
echo -n "Nom du fichier: "
read file
echo ">>" $(ls -l $file)
;;
4)
echo -n "Nouveau repertoire: "
read rep
if [ -d "$rep" ]
then
    cd $rep
    echo ">> Le repértoire a était changé avec succés."
else
    echo ">> Le répertoire $rep n'existe pas."
fi
;;
5)
echo -n "Nom fichier: "
read file
if [ -f "$file" ]
then
    echo -n "Nombres de lignes a afficher (-1 pour tout afficher): "
    read n
    if [ $n -eq -1 ]
    then
        echo ">>"
        cat $file
    elif [ $n -ge 0 ]
    then
        echo ">>"
        head -$n $file
    else
        echo ">> Vous devez rentrer un nombre supérieur ou égale 0 (ou -1 pour tous afficher) !"
    fi
else
    echo ">> Le fichier $file n'existe pas."
fi
;;
6)
echo -n "Nom du nouveau repertoire: "
read file
if [ -d "$file" ]
then
    echo ">> Le répertoire $file existe déjà."
else
    mkdir $file
    echo ">> Répertoire $file créé avec succés."
fi
;;
7)
echo -n "Nom du répertoire à supprimer: "
read file
if [ -d "$file" ]
then
    rmdir $file
    echo ">> Répertoire $file supprimé avec succés."
else
    echo ">> Le répertoire $file n'existe pas."
fi
;;
8)
echo -n "Nom du nouveau fichier: "
read file
if [ ! -f "$file" ]
then
    touch $file
    echo ">> Fichier $file créé avec succés."
else
    echo ">> Le fichier $file existe déjà."
fi
;;
9)
echo -n "Nom du fichier à supprimer: "
read file
if [ ! -f "$file" ]
then
    echo ">> Le fichier $file n'existe pas."
else
    rm $file
    echo ">> Fichier $file supprimé avec succés."
fi
;;
10)
echo -n "Nom du fichier ou répertoire à rechercher: "
read file
if [ -e "$file" ]
then
    echo ">> Le fichier ou répertoire $file existe."
else
    echo ">> Le fichier ou répertoire $file n'existe pas."
fi
;;
11)
echo -n "Nom du fichier ou répertoire à copier: "
read file
echo -n "Destination: "
read dest
if [ -e "$file" ]
then
    cp -r $file $dest
    echo ">> Fichier ou répertoire $file copié avec succés."
else
    echo ">> Le fichier ou répertoire $file n'existe pas."
fi
;;
12)
echo -n "Nom du fichier ou répertoire à déplacer: "
read file
echo -n "Destination: "
read dest
if [ -e "$file" ]
then
    mv $file $dest
    echo ">> Fichier ou répertoire $file déplacé avec succés."
else
    echo ">> Le fichier ou répertoire $file n'existe pas."
fi
;;
13)
echo -n "Nom du fichier ou répertoire à compresser: "
read file
if [ -e "$file" ]
then
    tar -czf $file.tar.gz $file
    echo ">> Fichier ou répertoire $file compressé avec succés."
else
    echo ">> Le fichier ou répertoire $file n'existe pas."
fi
;;
14)
echo -n "Nom du fichier à décompresser: "
read file
if [ -f "$file" ]
then
    tar -xzf $file
    echo ">> Fichier $file décompressé avec succés."
else
    echo ">> Le fichier $file n'existe pas."
fi
;;
15)
echo ">>" $(df -h)
;;
16)
echo ">>" $(ps aux)
;;
17)
echo -n "ID du processus à tuer: "
read pid
if [ -e /proc/$pid ]
then
    kill $pid
    echo ">> Processus $pid tué avec succés."
else
    echo ">> Le processus $pid n'existe pas."
fi
;;
*)
echo "Choix non proposé"
;;
esac
done
