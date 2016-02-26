CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : ANSI.bat                                                      ^|
echo ^| Version     : 0.2                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 13/03/2015                                                    ^|
echo ^| Description : Affiche les accents dans l'encodage cp850 de l'invite de      ^|
echo ^|               commande Windows.                                             ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ dans l'encodage ANSI(cp1252). ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenˆtre reste affich‚e
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

echo "Affichage des caractŠres diacritiques fran‡ais dans l'encodage cp850 :"
REM  "é è ç à â ê î ù"
echo "‚ Š ‡ … ƒ ˆ Œ —"

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenˆtre reste affich‚e
echo Appuyer sur une touche pour quitter le programme.
pause>nul 