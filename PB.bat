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
    echo                       r2.1
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo 1. Files Cleaner
    echo 2. RAM Cleaner
    echo 3. Registry Patcher
    echo 4. Disk Checker and Fixer
    echo 5. DNS Configurator
    echo 6. Remove bloatwares
    echo 7. Disable start-up programs
    echo 8. Reset Settings
    echo 0. Exit
    set /p mm=Please enter the number of choice then press ENTER:
    If %mm%==0 (
        cls
        goto x
    )
    If %mm%==1 (
        cls
        goto cln
    )
    If %mm%==2 (
        cls
        goto ram
    )
    If %mm%==3 (
        cls
        goto rgp
    )
    If %mm%==4 (
        cls
        goto dskchk
    )
    If %mm%==5 (
        cls
        goto dnsc
    )
    If %mm%==6 (
        cls
        goto rmv
    )
    If %mm%==7 (
        cls
        goto dsp
    )
    If %mm%==8 (
        cls
        goto reset
    )

:cln
    color 0b    
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo                 Run files cleaner?
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
    
:ram
    color 0c
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo        Do you want to enable RAM Clearer?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p ram=Y(es) or N(o)?

    If %ram%==Y (
        pause
        goto MMenu
    )
    If %ram%==N (
        goto MMenu
    )

:rgp
    color 0d
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo       Do you want to apply Registry Patches?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p rgp=Y(es) or N(o)?

    If %rgp%==Y (
        pause
        goto MMenu
    )
    If %rgp%==N (
        goto MMenu
    )

:dskchk
    color 0e
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo            Checking disks for errors...
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    goto MMenu

:dnsc
    color 0f
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo        Do you want to change dns settings?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p dnsc=Y(es) or N(o)?

    If %dnsc%==Y (
        pause
        goto MMenu
    )
    If %dnsc%==N (
        goto MMenu
    )

:rmv
    color 0a
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo Do you want to remove pre-installed bloatware applications?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p rmv=Y(es) or N(o)?

    If %rmv%==Y (
        pause
        goto MMenu
    )
    If %rmv%==N (
        goto MMenu
    )

:dsp
    color 0b
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo      Do you want to disable start-up programs?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p dsp=Y(es) or N(o)?

    If %dsp%==Y (
        pause
        goto MMenu
    )
    If %dsp%==N (
        goto MMenu
    )

:reset
    color 0c
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo          Do you want to reset settings?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p set=Y(es) or N(o)?

    If %set%==Y (
        pause
        goto MMenu
    )
    If %set%==N (
        goto MMenu
    )

:x
    color 70
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo        Are you sure to close the program?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p close=Y(es) or N(o)?
    If %close%==Y (
       exit
    )
    If %close%==N (
       goto MMenu
    )
