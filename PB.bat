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
    echo                       r2.3
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo 1. Files Cleaner
    echo 2. RAM Cleaner
    echo 3. Registry Patcher
    echo 4. Disk Checker and Fixer
    echo 5. DNS Configurator
    echo 6. Remove bloatwares
    echo 0. Exit
    set /p mm=Please enter the number of choice then press ENTER:
    
    If %mm%==0 (
        goto x
    ) else (
    If %mm%==1 (
        goto cln
    ) else (
    If %mm%==2 (
        goto ram
    ) else (
    If %mm%==3 (
        goto rgp
    ) else (
    If %mm%==4 (
        goto dskchk
    ) else (
    If %mm%==5 (
        goto dnsc
    ) else (
    If %mm%==6 (
        goto rmv
    ) else ( echo Unknown value input! Please retry
             pause
             goto MMenu 
    )))))))

:cln
    cls
    color 0b    
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo                 Run files cleaner?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p cln=Yes(1) or No(0)?

    If %cln%==1 (
        echo Running cleaner...
        pause
        goto MMenu
    ) else (
    If %cln%==0 (
        echo Skipped cleaner...
        goto MMenu
    ) else ( echo Unknown value input! Please retry
             pause
             goto cln
    ))
    
:ram
    cls
    color 0c
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo        Do you want to enable RAM Clearer?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p ram=Yes(1) or No(0)?

    If %ram%==1 (
        pause
        goto MMenu
    ) else (
    If %ram%==0 (
        goto MMenu
    ) else ( echo Unknown value input! Please retry
             pause
             goto ram 
    ))

:rgp
    cls
    color 0d
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo       Do you want to apply Registry Patches?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p rgp=Yes(1) or No(0)?

    If %rgp%==1 (
        pause
        goto MMenu
    ) else (
    If %rgp%==0 (
        goto MMenu
    ) else ( echo Unknown value input! Please retry
             pause
             goto rgp 
    ))

:dskchk
    cls
    color 0e
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo            Checking disks for errors...
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    pause
    goto MMenu

:dnsc
    cls
    color 0f
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo        Do you want to change dns settings?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p dnsc=Yes(1) or No(0)?

    If %dnsc%==1 (
        pause
        goto MMenu
    ) else (
    If %dnsc%==0 (
        goto MMenu
    ) else ( echo Unknown value input! Please retry
             pause
             goto dnsc 
    ))

:rmv
    cls
    color 0a
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo Do you want to remove pre-installed bloatware applications?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p rmv=Yes(1) or No(0)?

    If %rmv%==1 (
        pause
        goto MMenu
    ) else (
    If %rmv%==0 (
        goto MMenu
    ) else ( echo Unknown value input! Please retry
             pause
             goto rmv 
    ))

:x
    cls
    color 70
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo        Are you sure to close the program?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p close=Yes(1) or No(0)?
    If %close%==1 (
       exit
    ) else (
    If %close%==0 (
       goto MMenu
    ) else ( echo Unknown value input! Please retry
             pause
             goto x 
    ))
