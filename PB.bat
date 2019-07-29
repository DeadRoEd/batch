@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


:MMenu
    cls
    color 0a
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo               Performance Booster
    echo                        v2
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo 1. Temporary files cleaner
    echo 2. Perfetch files cleaner
    echo 3. Programs
    echo 4. Exit
    set /p mm=Please enter the number of choice then press ENTER:
    If %mm%==1 (
        cls
        goto cln
    )
    If %mm%==2 (
        cls
        goto prf
    )
    If %mm%==3 (
        cls
        goto pgr
    )
    If %mm%==4 (
        cls
        goto x
    )

:cln
    color 0b    
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo Run temporary files cleaner?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p cln= Y(es) or N(o)?

    If %cln%==Y (
        echo Running cleaner...
        Del /S /F /Q %temp%
        Del /S /F /Q %Windir%\Temp
        pause
        goto MMenu
    )
    If %cln%==N (
        echo Skipped cleaner...
        goto MMenu
    )
    
:prf
    color 0c
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo Run perfetch files cleaner?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p prf= Y(es) or N(o)?

    If %prf%==Y (
        echo Running cleaner...
        Del /S /F /Q %temp%
        Del /S /F /Q %Windir%\Temp
        pause
        goto MMenu
    )
    If %prf%==N (
        echo Skipped cleaner...
        goto MMenu
    )
    
:pgr
    color 0d
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo What program do you want to install?
    echo 1. RAMBooster
    echo 2. CPUSet
    echo 0. Go back to menu
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p pgr=Please enter the number of choice then press ENTER:

    If %pgr%==1 (
        pause
        goto MMenu
    )
    If %pgr%==2 (
        pause
        goto MMenu
    )
    If %pgr%==0 (
        goto MMenu
    )
    

:x
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo Are you sure to close the program?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p close= Y(es) or N(o)?
    If %close%==Y (
       exit
    )
    If %close%==N (
       goto MMenu
    )
