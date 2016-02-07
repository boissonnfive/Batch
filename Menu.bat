CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Menu.bat                                                      ^|
echo ^| Version     : 0.2                                                           ^|
echo ^| Auteur      : Bruno Boissonnet                                              ^|
echo ^| Date        : 13/03/2015                                                    ^|
echo ^| Description : D‚monstration d'un menu pour lancer des programmes.           ^|
echo ^| Remarques   : Micorosoft Office doit ˆtre install‚.                         ^|
echo +-----------------------------------------------------------------------------+
echo(
echo Faire Ctrl+C pour quitter le programme ou appuyer sur une touche pour continuer.

REM On fait une pause pour que la fenêtre reste affichée
pause>nul

REM +--DEBUT-DU-PROGRAMME---------------------------------------------------------+

:debut

echo A- Lancer Word
echo B- Lancer Excel
echo C- Lancer Powerpoint
echo D- Quitter le programme

CHOICE /C abcd /N /T 90 /D a /M "Choisissez le programme … lancer."

If errorlevel 4 goto fin
If errorlevel 3 SET LOGICIEL=POWERPNT & goto start_software
if errorlevel 2 SET LOGICIEL=excel & goto start_software
if errorlevel 1 SET LOGICIEL=winword & goto start_software

:start_software
echo %LOGICIEL%
start "" %LOGICIEL%
goto debut

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+
:fin
rem si on met "goto debut" ici, on retourne au debut du menu.
rem (dans ce cas il faut penser à ajouter une option quitter dans le menu)

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
