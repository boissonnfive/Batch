# Batch

Divers scripts batch.

*NOTE: tous les scripts sont écrits avec l'encodage cp850 (pour un affichage correct dans l'invite de commande Windows).*


## modele.bat

Ce fichier batch se veut un fichier modèle pour créer un fichier batch.

Il contient :

1. Une ligne qui efface l'écran : `CLS`.
2. Une ligne pour ne pas afficher les commentaires : `echo off`.
3. Un en-tête pour expliquer le quoi, qui, pourquoi et comment du fichier.
4. Une ligne permettant à l'utilisateur de quitter le script avant qu'il n'ait fait quoi que ce soit.
5. Un repère de début du code du script (on écrira le code sous ce repère).
6. Un repère de fin du code du script (on n'a plus rien à écrire après).
7. Un instruction pour que le script ne quitte pas de suite, mais attende une action de l'utilisateur (afin de laisser voir le résultat du script à l'utilisateur).

Tous les scripts batch de ce dépôt devront utiliser ce modèle (et être modifiés en conséquence quand le modèle sera modifié).

## ANSI.bat

Affiche les accents dans l'encodage cp850.
(et leur équivalent en commentaire dans le code)

## menu.bat

Démonstration de l'utilisation d'un menu pour lancer un programme sélectionné.

- commande `CHOICE` : pour créer un menu
- commande `START`  : pour lancer un programme


## Install_langue_fr_en_mode_admin.bat

Copie un fichier dans un dossier "Program Files" (doit être lancé avec les droits administrateur).

Démonstration de l'utilisation des commandes : 

- commande `pushd` : pour enregistrer le réperoire courant et se placer dans le répertoire indiqué
- commande `popd`  : pour revenir au répertoire initial
- commande `%~dp0` : renvoie le chemin du script en cours