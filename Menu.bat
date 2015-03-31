CLS REM On efface l'‚cran
@echo off
echo +-----------------------------------------------------------------------------+
echo ^| Fichier     : Menu.bat                                                      ^|
echo ^| Version     : 0.1                                                           ^|
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
If errorlevel 3 goto lancer_powerpoint
if errorlevel 2 goto lancer_excel
if errorlevel 1 goto lancer_word


:lancer_word
start "" winword.exe
REM "C:\Program Files (x86)\Microsoft Office\Office12\winword.exe"
goto debut

:lancer_excel
start "" excel.exe
REM "C:\Program Files (x86)\Microsoft Office\Office12\excel.exe"
goto debut

:lancer_powerpoint
start "" POWERPNT.exe
REM "C:\Program Files (x86)\Microsoft Office\Office12\POWERPNT.exe"
goto debut

REM +--FIN-DU-PROGRAMME-----------------------------------------------------------+
:fin
rem si on met "goto debut" ici, on retourne au debut du menu.
rem (dans ce cas il faut penser à ajouter une option quitter dans le menu)

echo(
REM On fait une pause pour que la fenêtre reste affichée
echo Appuyer sur une touche pour quitter le programme.
pause>nul 
