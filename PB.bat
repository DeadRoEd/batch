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

:strt0
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo Do you wish to install and start Performance Booster?
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    set /p strt=Yes(1) or No(0)?

    If %strt%==1 (
        goto strt1
    ) else (
    If %strt%==0 (
        exit
    ) else ( echo Unknown value input! Please retry
            pause
            goto strt0
    ))

:strt1
REM --> Set variables

:startup
    echo Preparing variables needed...
    REM --> Directories
    set PBdir=%HOMEDRIVE%%HOMEPATH%\PB
    set rdir=%PBdir%\ram
    goto dircheck

:dircheck
    if not exist "%PBdir%" (
        md "%PMdir%"
    )
    if not exist "%rdir%" (
        md "%rdir%"
    )

:start
    REM --> Main Files
    set pbstart=%PBdir%\PBstart.bat

    REM --> RAMOPS
    set rvbs=%rdir%\rboost.vbs
    set ron=%rdir%\r_on
    set rc1=%rdir%\rc.1
    set rc2=%rdir%\rc.2
    set rc3=%rdir%\rc.3
    set rc4=%rdir%\rc.4
    set rt1=%rdir%\rt.1
    set rt2=%rdir%\rt.2
    set rt3=%rdir%\rt.3
    goto create

:create
    cd "%PBdir%"
    echo Creating start-up batch file...
    REM --> create PBstart.bat
        (
        echo @echo off 
        echo ^set PBdir=%HOMEDRIVE%%HOMEPATH%\PB
        echo ^set rdir=%PBdir%\ram
        echo ^set pbstart=%PBdir%\PBstart.bat
        echo ^set rvbs=%rdir%\rboost.vbs
        echo ^set ron=%rdir%\r_on
        echo ^set rc1=%rdir%\rc.1
        echo ^set rc2=%rdir%\rc.2
        echo ^set rc3=%rdir%\rc.3
        echo ^set rc4=%rdir%\rc.4
        echo ^set rtime1=%rdir%\rt.1
        echo ^set rtime2=%rdir%\rt.2
        echo ^set rtime3=%rdir%\rt.3
        ) >pbstart.bat
    move /y "%pbstart%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
    pause
    goto MMenu

REM --> Menu Start

    :MMenu
        cd %PBdir%
        cls
        color 0a
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo               Performance Booster
        echo                        r3
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
        cd %rdir%
        echo Checking if RAM Optimizer is already enabled...
        goto ramcheck

        :ramcheck
        if exist "%ron%" goto ramexist
        if not exist "%ron%" goto ram1

        :ramexist
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        REM --> for rcls
        if exist "%rc1%" echo RamOps enabled for 512MB RAM
        if exist "%rc2%" echo RamOps enabled for 1GB RAM
        if exist "%rc3%" echo RamOps enabled for 2GB RAM
        if exist "%rc4%" echo RamOps enabled for 4GB+ RAM
        REM --> for rte
        if exist "%rt1%" echo RamOps scheduled every 1 hour
        if exist "%rt2%" echo RamOps scheduled every 3 hours
        if exist "%rt3%" echo RamOps scheduled every 5 hours
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo  Do you want to change or disable RAM Optimizer?
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        set /p ram=Change(1), Disable(2) or Cancel(0)?
        
        If %ram%==1 (
            schtasks /delete /tn "RAM Optimizer" /f
            del /f /q *
            goto rclean
        ) else (
        If %ram%==2 (
            schtasks /delete /tn "RAM Optimizer" /f
            del /f /q *
            echo Successful! Going back to MMenu...
            pause
            goto MMenu
        ) else (
        If %ram%==0 (
            goto MMenu
        ) else ( echo Unknown value input! Please retry
                pause
                goto ramexist
        )))

        :ram1
        cls
        color 0c
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo       Do you want to enable RAM Optimizer?
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        set /p ram=Yes(1) or No(0)?

        If %ram%==1 (
            goto rclean
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

REM --> Menu End

REM --> MODULES Start

    REM --> RAMOPS Start

        :rclean
            cls
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo              How much RAM do you have?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rcln= 512MB (1), 1GB (2), 2GB (3), or 4GB+ (4) (0 to cancel)?
            
            If %rcln%==1 (
                set rc=1
                set rm=51200000
                echo Setting .vbs script for 512MB RAM...
                goto rtime
            ) else (
            If %rcln%==2 (
                set rc=2
                set rm=102400000
                echo Setting .vbs script for 1GB RAM...
                goto rtime
            ) else (
            If %rcln%==3 (
                set rc=3
                set rm=204800000
                echo Setting .vbs script for 2GB RAM...
                goto rtime
            ) else (
            If %rcln%==4 (
                set rc=4
                set rm=409600000
                echo Setting .vbs script for 4GB+ RAM...
                goto rtime
            ) else (
            If %rcln%==0 (
                echo Going back to menu...
                pause
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    pause
                    goto rclean
            )))))

        :rtime
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo   How often do you want to execute the optimizer?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rtx= Every 1 Hour (1), 3 Hours (2), or 5 Hours (3) (0 to go back)?
            
            If %rtx%==1 (
                set rtm=1
                echo Scheduling the task every 1 Hours...
                pause
                goto rexecute
            ) else (
            If %rtx%==2 (
                set rtm=3
                echo Scheduling the task every 3 Hours...
                pause
                goto rexecute
            ) else (
            If %rtx%==3 (
                set rtm=5
                echo Scheduling the task every 5 Hours...
                pause
                goto rexecute
            ) else (
            If %rtx%==0 (
                echo Going back...
                pause
                goto rclean
            ) else ( echo Unknown value input! Please retry
                    pause
                    goto rtime
            ))))

        :rexecute
            echo FreeMem=Space(%rm%) >rboost.vbs
            schtasks /create /tn "RAM Optimizer" /tr "%rvbs%" /mo %rtm% /sc hourly 
            echo boostrm=%rcln% >rc.%rcln%
            echo boosttime=%rtx% >rt.%rtx%
            echo nul >r_on
            echo Successful! Going back to menu...
            pause
            goto MMenu

    REM --> RAMOPS End

REM --> Modules End

REM --> ROLES

REM --> @Ronwell Carl Langit and @Isma Garcia
REM --> files cleaner, and disk checker and fixer

REM --> @Luis Gabriel Palacios @Jude Mendoza Duqueza and @Mark Quinto 
REM --> DNS Configurator and remove bloatwares
