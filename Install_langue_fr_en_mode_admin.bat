CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Install_langue_fr_en_mode_admin.bat                           ^|
echo ^| Version     : 0.1                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 26/02/2016                                                    ^|
echo ^| Description : Copie le fichier de langue fran‡aise dans le r‚pertoire du    ^|
echo ^|               programme ImgBurn.                                            ^|
echo ^| Remarques   : Le fichier doit ˆtre sauvegard‚ dans l'encodage ANSI(cp1252). ^|
echo ^|               Le fichier doit ˆtre lanc‚ en mode administrateur.            ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

:: Va dans le dossier du script (pour trouver le fichier source)
pushd %~dp0


:: Copie le fichier dans le dossier "Program Files"
:: Attention ! Sur un systŠme 64 bits, le dossier est "Program Files (x86)"

If not exist "C:\Program Files (x86)\ImgBurn\Languages\" (
	copy french.lng "C:\Program Files\ImgBurn\Languages\"
) else (
	copy french.lng "C:\Program Files (x86)\ImgBurn\Languages\"
)

:: revient dans le dossier initial
popd

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
