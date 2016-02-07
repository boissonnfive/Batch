CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Menu.bat                                                      ^|
echo ^| Version     : 0.3                                                           ^|
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
If errorlevel 3 SET LOGICIEL=POWERPNT & goto suivant
if errorlevel 2 SET LOGICIEL=excel & goto suivant
if errorlevel 1 SET LOGICIEL=winword & goto suivant

:suivant
echo(
echo Vous avez tap‚ : %LOGICIEL%
REM echo Si le nom du logiciel est correct, appuyer sur une touche.
set /p ma_saisie=Si le nom du logiciel est correct, tapez O (Oui), sinon tapez N (Non). Faire Ctrl+C pour quitter le programme.

if %ma_saisie% == N (
	goto debut
) else if %ma_saisie% == n (
	goto debut
)

:start_software
REM echo %LOGICIEL%
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
