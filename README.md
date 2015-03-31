# Batch

Miscellaneous batch files.

*NOTE: All the files are written using Windows-1252 encoding.*


## modele.bat

Ce fichier batch se veut un fichier modèle pour créer un fichier batch.

Il contient :

1. Une ligne qui efface l'écran : `CLS`.
2. Une ligne pour ne pas afficher les commentaires : `echo off`.
3. Un en-tête pour expliquer le quoi, qui, pourquoi et comment du fichier.
4. Une ligne permettant à l'utilisateur de quitter le script avant qu'il n'ait fait quoi que ce soit.
5. Un repère de début du code du script (on écrira le code sous cet repère).
6. Un repère de fin du code du script (on n'a plus rien à écrire après).
7. Un instruction pour que le script ne quitte pas de suite, mais attende une action de l'utilisateur (afin de laisser voir le résultat du script à l'utilisateur).

Tous les scripts batch de ce dépôt devront utiliser ce modèle (et être modifiés en conséquence quand le modèle sera modifié).

## ANSI.bat

Affiche les accents au format ANSI.
(et leur équivalent en commentaire dans le code)