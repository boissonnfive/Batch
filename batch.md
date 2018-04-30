# Mes notes sur Batch

## À voir

- [Batch](https://technet.microsoft.com/fr-fr/library/bb490869.aspx)
- [Fonctions](http://steve-jansen.github.io/guides/windows-batch-scripting/part-7-functions.html)
- [WMIC](https://blogs.technet.microsoft.com/askperf/2012/02/17/useful-wmic-queries/)

Exemple :

    C:\Users\brb06301\Desktop>wmic baseboard get Manufacturer
    Manufacturer
    LENOVO



## Les bases

### Désactiver l'affichage des commandes (@)

    echo bonjour
    => Affiche :
    echo bonjour
    bonjour
    @echo bonjour
    => Affiche:
    bonjour

Pour désactiver l'affichage de toutes les commandes d'un fichier batch :

    @echo off

Pour remettre comme avant :

    @echo on

**=> On commencera tout fichier batch par la ligne : @echo off.**

### Mettre en commentaires (REM ou ::)
   
    REM Ceci est un commentaire qui ne sera pas affiché (si @echo off)
     
    echo %CD%    REM Affiche le répertoire en cours
    
    :: Deuxième type de commentaire avec des deux points


### Initialisation et utilisation des variables (set et %)

    Set NOM_FICHIER=monfichier.bat                 REM set pour créer une variable chaînes de caractères
    set /a somme=2+5                               REM set /a pour une variable numérique
    set /p ma_saisie=Entrez le texte à saisir      REM set /p pour récupérer les données de l'utilisateur

    echo %NOM_FICHIER%                             REM %variable% pour afficher le contenu de la variable


### Conditions (If/else)

    if [COMPARE 1] [COMPARANT] [COMPARE 2] (
     :: action si la condition est respectée
    ) else (
     :: action si la condition n'est pas respectée
    )

Opérateur de comparaison : equ (ou ==), neq, lss, leq, gtr, geq

    if %variable1% == 12 (
     echo variable1 est egal a 12
    ) else (
     echo variable1 n'est pas egal a 12
    )

    if not exist [FICHIER] (
     :: action si la condition est respectée
    ) else (
     :: action si la condition n'est pas respectée
    )


### Les boucles (For ... DO)##

    For %%v in (5 4 3 2 1) do (
    echo %%v
    )
    
    If (comparaison) (
        GOTO :instruction1
    ) else (
        GOTO :instruction2
    )


    REM Boucle de 0 à 50 (compris) avec un pas de 1
    For /l %%v in (0, 1, 50) do (
     echo %%v
    )


    FOR %%i in ("144C" "147C" "144D" "1590") DO (
    FINDSTR /I /X "SystemID=%%~i" C:\HP\BIN\RStone_BBV.INI >> %APP_LOG%
    IF NOT ERRORLEVEL 1 CALL :DEL_SOURCE C:\SWSETUP\%BIT_NAME% & ECHO System Board ID did not supported >>%APP_LOG% & GOTO RESULTPASSED
    )

### Manipulation de string

A ajouter :


- Chaînes de caractères :
    - rechercher une sous-chaîne dans une chaîne
    - remplacer une sous-chaîne dans une chaîne
    - Récupérer une sous-chaîne d'une chaîne
    - Concaténer deux chaînes

**Concaténer deux chaînes**

    set VARIABLE_DEBUT=Bonjour
    set VARIABLE_FIN= tout le monde!
    set VARIABLE_TOTAL=%VARIABLE_DEBUT%%VARIABLE_FIN%
    echo %VARIABLE_TOTAL%
    REM => Bonjour tout le monde!

**Récupérer une sous-chaîne d'une chaîne**
*voir set /?*

Exemple 1 : Récupérer les 10 premiers caractères d'une chaîne.

    set DATE_FICHIER="%~t0"
    REM => 26/08/2016 14:54
    echo %DATE_FICHIER:~0,10%
    REM ou echo %DATE_FICHIER:~0,-6%
    REM => 26/08/2016

Exemple 2 : Récupérer la sous-chaîne de 4 caractères qui débute au caractère 6 d'une chaîne.

    set DATE_FICHIER="%~t0"
    REM => 26/08/2016 14:54
    echo %DATE_FICHIER:~6,4%
    REM => 2016

Exemple 3 : Supprimer le premier caractère d'une variable.

    set DATE_FICHIER="%~t0"
    REM => 26/08/2016 14:54
    echo %DATE_FICHIER:~1%
    REM => 6/08/2016 14:54


**Remplacer une sous-chaîne dans une chaîne**

Exemple 1 : remplacer le mot "exemple" par le mot "simple".

    set CHAINE_EXEMPLE="Une chaŒne exemple"
    echo %CHAINE_EXEMPLE:exemple=simple%
    REM => Une chaŒne simple

Exemple 2 : Supprimer tous les espaces (les remplacer par rien)

    set CHAINE_EXEMPLE="Une chaŒne exemple"
    echo %CHAINE_EXEMPLE: =%
    REM => UnechaŒneexemple


### Les paramètres du script (%0)

    set /a compteur=0
    :: Affiche tous les paramètres du script
    For %%v in (%*) do (
        :: echo %%v
        set /a compteur=compteur+1
    )
    
    echo Vous avez pass‚ %compteur% paramŠtres."
    echo %1 %2 %3 %4 %5

*NOTE: il n'y a pas de variable qui contient le nombre de paramètres. Il faut le calculer. Les six paramètres sont : %0 (le chemin complet du script), %1, %2, %3, %4, %4 et %5).*


### Lancer un fichier batch (call)

    CALL c:\System.sav\Util\TDCTWKs\sr.cmd


### Récupérer le résultat d'une commande dans une variable

Exemple 1 : Récupérer l'adresse IP de la carte WIFI (qui s'appelle "LAN_WIFI").

    for /f "delims=" %%a in ('netsh interface ip show addresses "LAN_WIFI"  ^| findstr "Adresse"') do @set ADRESSE_IP=%%a

Exemple 2 : récupérer le contenu du dossier en cours dans la variable LISTE_DOSSIER (quand on récupère plusieurs ligne, il faut utiliser les expansion retardées et la notation avec "!")

    setlocal enabledelayedexpansion enableextensions
    set LISTE_DOSSIER=
    for %%i in (*) do set LISTE_DOSSIER=!LISTE_DOSSIER! %%i
    set LISTE_DOSSIER=%LISTE_DOSSIER:~1% :: Supprime le premier espace
    echo %LISTE_DOSSIER%



### Terminer un fichier batch (exit)

    Exit /B codeSortie

Où codeSortie est un nombre qui indique si le script s'est bien terminé ou s'il y a eu des erreurs. On peut récupérer sa valeur dans la variable d'environnement "ERRORLEVEL".

    echo %ERRORLEVEL%


### Tester la valeur de retour

Toute COMMANDE (n'importe quelle commande interne ou exécutable) renvoie une valeur de retour qu'il faut tester.

    Find.exe /i "Result=FAILED" %CHECK_FILE%
    IF NOT [%ERRORLEVEL%]==[0] GOTO COULDNOT_FIND_FAIL


### Tracer dans un fichier (echo >>)

    Echo Created on : %Date% %Time%.>>%OUTPUT_FILE%


### Redirection du flux d'erreur sur le flux principal

Les erreurs iront dans le fichier out.txt (comme toute autre sortie)

    run.bat > out.txt 2>&1


### Tester l'existence d'un fichier

    IF EXIST %OLD_OUTPUT_FILE% del %OLD_OUTPUT_FILE% /f /q
    ou
    If NOT EXIST %BURNBOOTWARN_FILE% GOTO NO_BB_WARN
    ... (commnandes)
    :NO_BB_WARN
    ... (commandes)


### Récupérer le chemin du dossier contenant le fichier batch

    %~dp0


---


## Les commandes supplémentaires

### Nom du fichier ou du répertoire

voir for /?

    echo Le nom complet du script batch est    : "%~f0"
    echo Le r‚pertoire du script batch est     : "%~dp0"
    echo Le disque du script batch est         : "%~d0"
    echo Le nom du script batch est            : "%~nx0"
    echo Le nom du script batch sans extension : "%~n0"
    echo L'extension du script batch est       : "%~x0"
    echo Le nom court du script batch est      : "%~s0"
    echo Les attributs du script batch sont    : "%~a0"
    echo Les date/heure du script batch sont   : "%~t0"
    echo Le taille du script batch est         : "%~z0"

### Date et heure

    REM Affichage de la date courante
    date /T
    REM Affichage de l'heure courante
    time /T

ou 

    echo Date: %date% - Heure: %time%

### Créer un répertoire

    md C:\System.sav\Logs\EventLog\BB
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Créer un fichier vierge

    echo > fichier.txt
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Supprimer un répertoire

    RD /S /Q C:\System.sav\Util\TDCTWKs
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Supprimer un fichier

    DEL /Q /f C:\System.sav\CPQDONE.exe
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Renommer un fichier

    ren C:\System.sav\Logs\AdditionalCheck.log AdditionalCheck_Backup.log
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Déplacer un fichier

    MOVE C:\System.sav\Util\PININST.DON C:\System.sav\Logs\PININST_BBV2.DON
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Lister seulement les fichiers d'un dossier

    C:\Users\Bruno\Desktop>dir /B /A:-D-H
    Ansi.vbs
    Evalution.vbs
    Execute.vbs
    Execute2.vbs
    recup_date.bat
    test.txt
    test_ANSI.txt
    Unicode.vbs
    UTF8.vbs

    /B       pour lister seulement les noms
    /A:-D-H  pour enlever les répertoire (D) et les fichiers cachés (H)


    Si on ne veut que les fichiers qui ont une certaine extension

    C:\Users\Bruno\Desktop>dir /B /A:-D-H *.vbs
    Ansi.vbs
    Evalution.vbs
    Execute.vbs
    Execute2.vbs
    Unicode.vbs
    UTF8.vbs

### Lancer un exécutable ou ouvrir une fenêtre

    START notepad.exe %OUTPUT_FILE%
    START C:\ (ouvre l'explorateur windows sur C:)
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Arrêter un programme en cours

    taskkill.exe /im animatedLogo.exe
    IF ERRORLEVEL 1 GOTO RESULTFAILED

### Exporter une clé du registre

    reg.exe export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\MUI\UILanguages c:\system.sav\logs\MUI_%1_Chk.log
    reg load HKLM\Sys \Windows\system32\config\SYSTEM
    reg export HKLM\sys\ControlSet001\Control\MUI\UILanguages c:\system.    sav\logs\MUI_%1_Chk.log
    reg unload HKLM\sys


### Revenir à la racine d'un disque

    cd \ (revient à C: si on est dans C:\Users\Bruno)


### Rechercher dans un fichier

    Find.exe /i "Result=FAILED" %CHECK_FILE%
    IF NOT [%ERRORLEVEL%]==[0] GOTO COULDNOT_FIND_FAIL

ou

    FINDSTR "Result=FAILED" %CHECK_FILE%
    IF NOT [%ERRORLEVEL%]==[0] GOTO COULDNOT_FIND_FAIL

### Rechercher un dossier pour le renommer

On cherche un dossier "abritel" dans le répertoire courant (%~dp0), pour le renommer "bubuAbritel".

    for /f "delims=" %%i in ('dir /ad /b %~dp0') do (
        if /i "%%i"=="abritel" ren %~dp0abritel bubuAbritel
    )


### Créer un menu

    :selection_du_poste
    CLS :: On efface l'‚cran
    echo(
    echo ***** 2) S‚lection du poste … r‚cup‚rer.
    echo(
    echo a- Copier sur OP_01
    echo b- Copier sur OP_02
    echo c- Copier sur OP_03
    echo(
    
    CHOICE /C abcdefghij /N /T 90 /D a /M "Choisissez le poste … r‚cup‚rer en   tapant la lettre correspondante (ex: a pour OP_01)."
    
    If errorlevel 3 SET POSTE=OP_03
    if errorlevel 2 SET POSTE=OP_02
    if errorlevel 1 SET POSTE=OP_01
    
    echo(
    echo Vous avez tap‚ : %POSTE%
    set ma_saisie=
    set /p ma_saisie=Appuyer sur ENTRER pour valider ou sur toute autre touche puis ENTRER pour pour modifier le nom du poste. Faire Ctrl+C pour quitter le programme.

    if DEFINED ma_saisie goto selection_du_poste :: Si on appuie sur ENTRER seulement, ma_saisie n'est pas définie



### Récupérer le chemin du dossier en cours

    echo %CD%

### Se placer dans le répertoire du script

    REM On se met dans le répertoire du script
    pushd "%~dp0"
    
    REM On fait ce qu'on a à faire
    REM ...
    
    REM On se remet dans le répertoire d'origine
    popd

### Récupérer l'adresse IP

    netsh interface ip show addresses "LAN_Site"
    netsh interface ip show addresses "Wi-Fi"


----------------------------------------------------------------------

## Les variables d'environnement

Variable                        Valeur
%COMPUTERNAME%                  Le nom de l'ordinateur
%ComSpec%                       Indique l'emplacement de la console
%HOMEDRIVE%                     Indique où se situe le lecteur principal
%HOMEPATH%                      Indique où se trouve le dossier personnel de l'utilisateur en cours
%LOGONSERVER%                   Donne l'adresse réseau de l'ordinateur
%NUMBER_OF_PROCESSORS%          Donne le nombre de processus en cours
%OS%                            Donne le système d'exploitation installé
%Path%                          Donne les adresses PATH
%PROCESSOR_ARCHITECTURE%        Donne l'architecture du processeur
%PROCESSOR_IDENTIFIER%          Donne l'identification du processeur
%ProgramFiles%                  Donne l'adresse du répertoire des programmes
%SystemDrive%                   Donne le lecteur principal
%SystemRoot%                    Donne le répertoire où se situe le système
%TEMP%                          Donne l'adresse du répertoire temporaire
%TMP%                           Donne l'adresse du répertoire temporaire
%USERNAME%                      Donne le nom de l'utilisateur
%USERPROFILE%                   Donne le répertoire personnel de l'utilisateur en cours
%windir%                        Donne le répertoire où est installé Windows
%DATE%                          Date de l'ordinateur
%TIME%                          L'heure de l'ordinateur
%CD%                            Donne l'emplacement actuel de la console
%RANDOM%                        Nombre aléatoire
%CMDCMDLINE%                    Donne l'emplacement de la console.


------------------------------------------------------------------------------

# L'affichage des accents dans l'invite de commande windows #

## Définition du problème

1. Tapez le texte suivant dans le bloc-note :

*Ceci est un script batch qui affiche : Voilà l'été !.*

        @echo off
        echo "Voilà l'été !"

2. Enregistrez le fichier avec le nom echo_ANSI.bat (dans "Type", sélectionnez "Tous les fichiers", dans "Encodage", sélectionnez "ANSI").
3. Ouvrez l'invite de commande windows
4. Faites glisser le fichier echo_ANSI.bat sur l'invite de commande
5. Tapez "entrer"
6. Observez le résultat :

        "VoilÓ l'ÚtÚ !"

**Conclusion**

Nous obtenons "VoilÓ l'ÚtÚ !" au lieu de "Voilà l'été !" (les lettres accentuées ont été remplacées par d'autres, les lettres non accentuées et la poncutation sont affichées sans erreur).


## Explications : c'est un problème d'encodage

En réalité, les fichiers ne contiennent pas des caractères, mais des nombres binaires. Ce sont les programmes qui ouvrent ces fichiers qui transforment les nombres binaires en caractères selon une correspondance dans une table d'encodage.

Ainsi, le bloc-note, qui enregistre les fichiers dans les encodages ANSI, Unicode et UTF-8 va ouvrir le fichier en transformant les nombres binaires en caractères qui leur correspondent dans une de ces tables.

Reprenons notre exemple du fichier echo_ANSI.bat. Enregistré dans l'encodage ANSI, le bloc-note crée un fichier qui contient en réalité (ouvert dans un éditeur hexadécimal) :

        0x40 0x65 0x63 0x68 0x6F 0x20 0x6F 0x66 0x66 0x0D 0x0A       => @echo off
        0x65 0x63 0x68 0x6F 0x20 0x22 0x56 0x6F 0x69 0x6C 0xE0 0x20 0x6C 0x27 0xE9 0x74 0xE9 0x20 0X21 0x22 0x0D 0x0A                  => echo "Voilà l'été !"


où "Voilà" est encodé en "0x56 0x6F 0x69 0x6C 0xE0".

*NOTE: à la fin de chaque ligne, vous remarquerez les nombres 0x0D 0x0A qui sont la marque d'un saut de ligne dans le système d'exploitation Windows.*

Le "V" a été transformé selon la [table de correspondance ANSI (cp1252)][1] en "0x56", et ainsi de suite jusqu'au "à" en "0xE0".

L'invite de commande, qui s'attend à lire des caractères cp850, va transformer les caractères en suivant la table d'encodage cp850. En l'occurence, le "V" ne va pas poser de problème puisqu'il a la même correspondance hexadécimale (0x56). Le "o", le "i" et le "l" non plus (respectivement 0x6F 0x69 0x6C). Par contre, le nombre "0xE0" correspond à "Ó" dans [la table d'encodage cp850][2].
L'invite de commande va donc lire : "VoilÓ" au lieu de "Voilà".


## Comment résoudre ce problème d'affichage ?

Maintenant que nous avons savamment analysé le problème, comment le résoudre? En effet, il n'est pas possible d'enregistrer un fichier dans l'encodage "codepage 850" avec le bloc-note (seulement : ANSI, Unicode, UTF-8).

Il y a trois possibilités :

### Utiliser des caractères cp850 dans un fichier ANSI

On utilise les caractères ANSI correspondant au "codepage 850" dans le bloc-note (ex : un "é" en cp850 correspond à 0x82, or 0x82 correspond à "," en ANSI). On se retrouve avec la liste de correpondance suivante:

        cp850 : é è ç à â ê î ù
        ANSI  : ‚ Š ‡ … ƒ ˆ Œ —

En remplaçant les lettres accentuées par leur équivalent cp850, on écrit :

        echo "Voil… l'‚t‚ !"

### Utiliser la commande `copy con`

On rédige son texte directement dans l'invite de commande à l'aide de la commande "copy con" :

        C:\>copy con cp850.bat
        @echo off
        echo "Voilà l'été !"
        Taper Ctrl+c
        C:\>cp850.bat
        "Voilà l'été !"


### Utiliser la commande `chcp` pour changer la page de code de l'invite de commande

On modifie la page de code de l'invite de commande avec la commande suivante :

        C:\>chcp 1252
        C:\>echo.bat

Mais ça ne fonctionne pas bien, car la majorité des commandes Windows sont localisés, c'est-à-dire écrits en cp850. Si on change la page de code de l'invite de commande, les affichages des commandes seront mal interprétés (on a déplacé le problème ailleurs).


Finalement, **la première possibilité reste la meilleure**; il suffira de noter la correspondance des caractères accentués dans chacun de ses scripts batch.

### Encoder le fichier ANSI à la volée ###

Comme les trois mousquetaires étaient quatre, il reste une quatrième possibilité trouvée sur [l'internet][3] : encoder le fichier ANSI à la volée (lors de son exécution) en cp850.

Voici le code à ajouter à la première ligne de son fichier batch :

        set Filename=%0
        IF "%Filename:~-8%" == "-850.bat" GOTO CONVERT_CODEPAGE_END
            rem Converting code page from 1252 to 850.
            rem My editors use 1252, my batch uses 850.
            rem We create a converted -850.bat file, and then launch it.
            set File850=%~n0-850.bat
            PowerShell.exe -Command "get-content %0 | out-file -encoding oem -filepath  %File850%"
            call %File850%
            ::del %File850%
            EXIT /b 0
        :CONVERT_CODEPAGE_END
        REM code de son script batch ...


Ce code va vérifier que le nom du script ne se termine pas par "-850.bat" (qui est le suffixe des fichiers transformés en cp850 par le programme). Auquel cas, il converti le fichier en cp850 à l'aide de PowerShell (il faut donc avoir PowerShell sur sa machine). ■


[1]: https://fr.wikipedia.org/wiki/Windows-1252 "ANSI ou Windows cp1252 (cp pour codepage)"
[2]: https://fr.wikipedia.org/wiki/Page_de_code_850 "CodePage 850"
[3]: http://stackoverflow.com/questions/1427796/batch-file-encoding "Batch file encoding"


———————————————————————————————————————

C:\>dump junk.txt
junk.txt:
00000000  4865 6c6c 6f0d 0a48 656c 6c6f 2061 6761 Hello..Hello aga
00000010  696e 0d0a                               in..
C:\>