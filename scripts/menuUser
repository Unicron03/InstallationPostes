#!/bin/bash
clear
run=true
while $run
do
echo
echo -e "---\e[1;43mMenu Utilisateur\e[0m---------------------------"
echo -e "\e[1;32m1\e[0m: Afficher le shell actuel"
echo -e "\e[1;32m2\e[0m: Afficher le nom d'utilisateur"
echo -e "\e[1;32m3\e[0m: Afficher le nom de la machine"
echo -e "\e[1;32m4\e[0m: Afficher l'historique des commandes"
echo -e "\e[1;32m5\e[0m: Vider l'historique des commandes"
echo -e "\e[1;32m6\e[0m: Afficher l'utilisation de la mémoire"
echo -e "\e[1;32m7\e[0m: Afficher l'espace disque utilisé et disponible"
echo -e "\e[1;32m8\e[0m: Afficher la calculatrice"
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
echo ">> Votre shell actuel est : "$SHELL
;;
2)
echo ">> Votre nom d'utilisateur est : "$(whoami)
;;
3)
echo ">> Le nom de votre machine est : "$HOSTNAME
;;
4)
echo ">> Votre historique des commandes est : "
(history)
;;
5)
$(history -c)
echo ">> Votre historique à était vidé avec succés"
;;
6)
echo ">> L'utilisation de la mémoire est : "
free -h
;;
7)
echo ">> L'espace disque utilisé et disponible est : "
df -h
;;
8)
calc
echo ">> La calculatrice à été ouverte"
;;
*)
echo ">> Choix non proposé"
;;
esac
done

