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
    color 0b
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo               Performance Booster
    echo                      v1.1
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

REM --> Cleaner Section
echo Run temporary files cleaner?
set /p cln=Type 1 (Yes), 0 (No) or 2 (Exit) then press ENTER:
cls
color 0c
echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

If %cln%==1 (
    echo Running cleaner...
    Del /S /F /Q %temp%
    Del /S /F /Q %Windir%\Temp
)
If %cln%==0 (
    echo Skipped cleaner...
)
If %cln%==2 (
    goto exit
)

echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
pause
goto MMenu

:exit
    echo Are you sure to close the program?
    set /p close= Y(es) or N(o)?
    If %close%==Y (
       exit
    )
    If %close%==N (
       goto MMenu
    )
