@echo off


:prg

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

:strt1
REM --> Set variables

:startup
    echo Preparing variables needed...
    REM --> Directories
    set PBdir=%HOMEDRIVE%%HOMEPATH%\PB
    set rdir=%PBdir%\ram
    set regdir=%PBdir%\reg
    set regbup=%regdir%\backups
    set pb=%PBdir%\PB.bat

    goto dircheck

:dircheck
    echo Creating program directories...
    if not exist "%PBdir%" (
        md "%PMdir%"
    )
    if not exist "%rdir%" (
        md "%rdir%"
    )
    if not exist "%regdir%" (
        md "%regdir%"
    )
    if not exist "%regbup%" (
        md "%regbup%"
    )

:start
    REM --> Copy program
        copy PB.bat "%pb%" >nul

    REM --> REGEDIT
        set regon=%regdir%\reg_on
        set rp1=%regdir%\rp.1
        set rp2=%regdir%\rp.2
        set rp3=%regdir%\rp.3
        
    REM --> Local Machine
        set lmr=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
        set lmo=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
        set rd1=%regbup%\lmr.hiv
        set rd2=%regbup%\lmo.hiv
    REM --> Current User
        set cur=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
        set cuo=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce        
        set rd3=%regbup%\cur.hiv
        set rd4=%regbup%\cuo.hiv
    REM --> Desktop
        set dt=HKCU\Control Panel\Desktop
        set ra1=%regbup%\dt.hiv
    REM --> Explorer
        set ex=HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
        set re1=%regbup%\ex.hiv
    
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
    
    PING -n 3 127.0.0.1>nul
    goto MMenu2

REM --> Menu Start
    
    :MMenu
        cls
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo                   Please wait...
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        start "" "%pb%"
        PING -n 3 127.0.0.1>nul
        exit 

    :MMenu2
        cd %PBdir%
        cls
        color 0a
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo               Performance Booster
        echo                        r4
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo 1. Files Cleaner
        echo 2. RAM Cleaner
        echo 3. Registry Patcher
        echo 4. Disk Checker and Fixer
        echo 5. DNS Configurator
        echo 6. Remove bloatwares
        echo 0. Exit
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo    !Do not press enter without putting a value!
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
                PING -n 3 127.0.0.1>nul
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
            PING -n 3 127.0.0.1>nul
            goto MMenu
        ) else (
        If %cln%==0 (
            echo Skipped cleaner...
            goto MMenu
        ) else ( echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto cln
        ))
        
    :ram
        cls
        cd %rdir%
        goto ramcheck

    :rgp
        cls
        cd %regdir%
        goto regcheck


    :dskchk
        cls
        color 0e
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo            Checking disks for errors...
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        PING -n 3 127.0.0.1>nul
        goto MMenu

    :dnsc
        cls
        color 0f
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo        Do you want to change dns settings?
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        set /p dnsc=Yes(1) or No(0)?

        If %dnsc%==1 (
            PING -n 3 127.0.0.1>nul
            goto MMenu
        ) else (
        If %dnsc%==0 (
            goto MMenu
        ) else ( echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
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
            PING -n 3 127.0.0.1>nul
            goto MMenu
        ) else (
        If %rmv%==0 (
            goto MMenu
        ) else ( echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
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
                PING -n 3 127.0.0.1>nul
                goto x 
        ))

REM --> Menu End

REM --> MODULES Start

    REM --> REGEDIT Start

        :regcheck
            echo Checking if Registry Patches are already installed...
            PING -n 3 127.0.0.1>nul
            del "%regon%"
            if exist "%rp1%" (
                goto regexist
            ) else (
            if exist "%rp2%" (
                goto regexist
            ) else (
            if exist "%rp3%" (
                goto regexist
            ) else ( goto reg1
            )))

        :regexist
            cls
            type 1 >reg_on
            color 0c
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo Do you want to restore or modify the registry edits?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo 1. Restore
            echo 2. Modify
            echo 0. Go back to menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p resreg=Enter the number of choice:

            If %resreg%==1 (
                goto regresmenu
            ) else (
            If %resreg%==2 (
                goto regmenu
            ) else (
            If %resreg%==0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regexist
            )))
        
        :regresmenu
            cls
            color 0c
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                Registry Restore Menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            PING -n 3 127.0.0.1>nul
            if exist "%rp1%" echo 1. Start-up programs
            if exist "%rp2%" echo 2. Desktop
            if exist "%rp3%" echo 3. Explorer
            if exist "%regon%" echo 4. Restore All
            echo 0. Back to menu...
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p resrm=Enter the number of choice:

            If %resrm%==1 (
                set rall=0
                goto resrm1
            ) else (
            If %resrm%==2 (
                set rall=0
                goto resrm2
            ) else (
            If %resrm%==3 (
                set rall=0
                goto resrm3
            ) else (
            If %resrm%==4 (
                set rall=1
                goto rconfirm
            ) else (
            If %resrm%==0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regexist
            )))))

            :resrm1
                reg restore "%lmr%" "%rd1%" 
                reg restore "%lmo%" "%rd2%" 
                reg restore "%cur%" "%rd3%" 
                reg restore "%cuo%" "%rd4%" 
                del "%rd1%"
                del "%rd2%"
                del "%rd3%"
                del "%rd4%"
                del "%rp1%"
                goto rconfirm
            
            :resrm2
                reg restore "%dt%" "%ra1%" 
                del "%ra1%"
                del "%rp2%"
                goto rconfirm

            :resrm3
                reg restore "%ex%" "%re1%" 
                del "%re1%"
                del "%rp3%"
                goto rconfirm

            :rconfirm
                if %rall%==1 (
                    if exist "%rp1%" goto resrm1
                    if not exist "%rp1%" echo Done!
                    if exist "%rp2%" goto resrm2
                    if not exist "%rp2%" echo Done!
                    if exist "%rp3%" goto resrm3
                    if not exist "%rp3%" echo Done!
                    echo Successful! Now going back to main menu...
                    PING -n 3 127.0.0.1>nul 
                    goto MMenu
                ) else ( echo Successful! Now going back to main menu...
                    PING -n 3 127.0.0.1>nul 
                    goto resregcheck
                )
            
            :resregcheck
                if exist "%regon%" del "%regon%"
                echo Checking if Registry Patches are already installed...
                PING -n 3 127.0.0.1>nul
                if exist "%rp1%" (
                    goto regresmenu
                ) else (
                if exist "%rp2%" (
                    goto regresmenu
                ) else (
                if exist "%rp3%" (
                    goto regresmenu
                ) else ( goto MMenu
                )))

        :reg1
            color 0d
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo       Do you want to apply Registry Patches?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rgp=Yes(1) or No(0)?

            If %rgp%==1 (
                goto regmenu
            ) else (
            If %rgp%==0 (
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto reg1
            ))

        :regmenu
            cls
            color 0e
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo               Registry Patcher Menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            PING -n 3 127.0.0.1>nul
            if not exist "%rp1%" echo 1. Disable all Start-up programs
            if not exist "%rp2%" echo 2. Make desktop faster
            if not exist "%rp3%" echo 3. Make explorer faster
            echo 0. Go back to main menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo           !NOTE: Reboot after applying!
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rmm=Enter the number of choice:

            If %rmm%==1 (
                PING -n 3 127.0.0.1>nul
                if exist "%rp1%" goto rong
                goto regp1
            ) else (
            If %rmm%==2 (
                PING -n 3 127.0.0.1>nul
                if exist "%rp2%" goto rong
                goto regp2
            ) else (
            If %rmm%==3 (
                PING -n 3 127.0.0.1>nul
                if exist "%rp3%" goto rong
                goto regp3
            ) else (
            If %rmm%==0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regmenu
            ))))
        
        :rong
            echo Unknown value input! Please retry
            PING -n 3 127.0.0.1>nul
            goto regmenu

        :regp1 
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo   Do you want to disable all start-up programs?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rp1=Yes(1) or No(0)?

            If %rp1%==1 (
                if not exist "%regon%" type 1 >reg_on
                type 1 >rp.1
                REM --> Backup
                reg save "%lmr%" "%rd1%" /y
                reg save "%lmo%" "%rd2%" /y
                reg save "%cur%" "%rd3%" /y
                reg save "%cuo%" "%rd4%" /y
                REM --> Deletion
                reg delete "%lmr%" /f /va
                reg delete "%lmo%" /f /va
                reg delete "%cur%" /f /va
                reg delete "%cuo%" /f /va
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                goto regmenu
            ) else (
            If %rp1%==0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto regmenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regp1
            ))
        
        :regp2 
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo   Do you want to add tweaks to make desktop faster?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo !This will put stricter restrictions to applications!
            echo            !and remove visual animations!
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rp2=Yes(1) or No(0)?

            If %rp2%==1 (
                if not exist "%regon%" type 1 >reg_on
                type 1 >rp.2
                REM --> Backup
                reg save "%dt%" "%ra1%" /y
                REM --> Addition
                reg add "%dt%" /v AutoEndTasks /t REG_SZ /f /d 1
                reg add "%dt%" /v HungAppTimeout /t REG_SZ /f /d 1000
                reg add "%dt%" /v MenuShowDelay /t REG_SZ /f /d 8
                reg add "%dt%" /v WaitToKillAppTimeout /t REG_SZ /f /d 2000
                reg add "%dt%" /v LowLevelHooksTimeout /t REG_SZ /f /d 1000
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                goto regmenu
            ) else (
            If %rp2%==0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto regmenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regp2
            ))

        :regp3
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo Do you want to add tweaks to make file explorer faster?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo         !This will disable various properties!
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rp3=Yes(1) or No(0)?

            If %rp3%==1 (
                if not exist "%regon%" type 1 >reg_on
                type 1 >rp.3
                REM --> Backup
                reg save "%ex%" "%re1%" /y
                REM --> Addition
                reg add "%ex%" /v NoLowDiskSpaceChecks /t REG_DWORD /f /d 1
                reg add "%ex%" /v LinkResolveIgnoreLinkInfo /t REG_DWORD /f /d 1
                reg add "%ex%" /v NoResolveSearch /t REG_DWORD /f /d 1
                reg add "%ex%" /v NoResolveTrack /t REG_DWORD /f /d 1
                reg add "%ex%" /v NoInternetOpenWith /t REG_DWORD /f /d 1
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                goto regmenu
            ) else (
            If %rp3%==0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto regmenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regp3
            ))

            

    REM --> RAMOPS Start

        :ramcheck
            echo Checking if RAM Optimizer is already enabled...
            PING -n 6 127.0.0.1>nul
            if exist "%ron%" goto ramexist
            if not exist "%ron%" goto ram1

        :ramexist
            color 0c
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
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %ram%==0 (
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
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
                    PING -n 3 127.0.0.1>nul
                    goto ram 
            ))

        :rclean
            cls
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo              How much RAM do you have?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rcln= 512MB (1), 1GB (2), 2GB (3), or 4GB+ (4) (0 to cancel)?
            
            If %rcln%==1 (
                set rm=51200000
                echo Setting .vbs script for 512MB RAM...
                goto rtime
            ) else (
            If %rcln%==2 (
                set rm=102400000
                echo Setting .vbs script for 1GB RAM...
                goto rtime
            ) else (
            If %rcln%==3 (
                set rm=204800000
                echo Setting .vbs script for 2GB RAM...
                goto rtime
            ) else (
            If %rcln%==4 (
                set rm=409600000
                echo Setting .vbs script for 4GB+ RAM...
                goto rtime
            ) else (
            If %rcln%==0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
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
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx%==2 (
                set rtm=3
                echo Scheduling the task every 3 Hours...
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx%==3 (
                set rtm=5
                echo Scheduling the task every 5 Hours...
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx%==0 (
                echo Going back...
                PING -n 3 127.0.0.1>nul
                goto rclean
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto rtime
            ))))

        :rexecute
            type FreeMem=Space(%rm%) >rboost.vbs
            schtasks /create /tn "RAM Optimizer" /tr "%rvbs%" /mo %rtm% /sc hourly 
            type boostrm=%rcln% >rc.%rcln%
            type boosttime=%rtx% >rt.%rtx%
            type nul >r_on
            echo Successful! Going back to menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

    REM --> RAMOPS End

REM --> Modules End

REM --> ROLES

REM --> @Ronwell Carl Langit and @Isma Garcia
REM --> files cleaner, and disk checker and fixer

REM --> @Luis Gabriel Palacios @Jude Mendoza Duqueza and @Mark Quinto 
REM --> DNS Configurator and remove bloatwares

REM --> End code
goto prg
