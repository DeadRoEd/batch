@echo off

set ver=r5

Title Performance Booster %ver%
mode con: cols=62 lines=16

:prg

:BatchGotAdmin
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
REM --> Start Start

:startup
    echo Preparing variables needed...
    REM --> Directories
    set PBdir=%HOMEDRIVE%%HOMEPATH%\PB
    set Dsktp=%USERPROFILE%\Desktop
    set strtup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
    set pb=%PBdir%\PB.bat
    set fdir=%PBdir%\fcleaner
    set rdir=%PBdir%\ram
    set regdir=%PBdir%\reg
    set regbup=%regdir%\backups

    goto dircheck

:dircheck
    echo Creating program directories...
    if not exist "%PBdir%" (
        md "%PBdir%"
    )
    if not exist "%fdir%" (
        md "%fdir%"
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

    REM --> FCLEAN
        set fcon=%fdir%\fc_on
        set fbat1=%fdir%\fclean1.bat
        set fbat2=%fdir%\fclean2.bat
        set fbat3=%fdir%\fclean3.bat
        set fbatx1=%strtup%\fclean1.bat
        set fbatx2=%strtup%\fclean2.bat
        set fbatx3=%strtup%\fclean3.bat
    REM --> FCLEAN check
        set c1=%fdir%\c.1
        set c2=%fdir%\c.2
        set c3=%fdir%\c.3

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

    REM --> REMBLT
        set bltlist=removedbltwrs.txt
        set PBblt=%PBdir%\%bltlist%
        set b1="Cyberlink Media Suite"
        set b2="PowerDVD"
        set b3="Nero"
        set b4="Candy Crush Saga"
        set b5="Dolby Atmos"
        set b6="SketchBook"
        set b7="3D viewer"
        set b8="Messaging"
        set b9="Microsoft News"
        set b10="Mixed Reality Portal"
        set b11="Snip & Sketch"
        set b11x="Snip ^& Sketch"
        set b12="Cyberlink Power Director"
        set b13="Cyberlink Youcam"
        set b14="Mobile Plans"
        set b15="People"
        set b16="Web Media Extensions"
        set b17="Web Image Extensions"
        set b18="QuickTime"
        set b19="MyCleanPC "
        set b20="Shockwave Player"
        set b21="Microsoft Silverlight"
        set b22="Coupon Printer for Windows"
    
    PING -n 3 127.0.0.1>nul
    goto MMenu2

REM --> Start End

REM --> Menu Start
    
    :MMenu
        cls
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo                         Please wait...
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        start "" "%pb%"
        PING -n 3 127.0.0.1>nul
        exit 

    :MMenu2
        cd %PBdir%
        cls
        color f1
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo                     Performance Booster
        echo                            %ver%
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo 1. Files Cleaner
        echo 2. RAM Cleaner
        echo 3. Registry Patcher
        echo 4. Disk Checker and Fixer
        echo 5. DNS Configurator
        echo 6. Remove bloatwares
        echo 0. Exit
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo          !Do not press enter without putting a value!
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
        cd %fdir%
        goto fccheck

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
        color f5
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo                  Checking disks for errors...
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        PING -n 3 127.0.0.1>nul
        goto MMenu

    :dnsc
        cls
        color f0
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo              Do you want to change dns settings?
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
        cd %Dsktp%
        goto bltchk

    :x
        cls
        color 70
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo              Are you sure to close the program?
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        set /p close=Yes(1) or No(0)?
        
        If %close%==1 (
            del "%pb%"
            rd /q "%regbup%"
            rd /q "%regdir%"
            rd /q "%fdir%"
            rd /q "%rdir%"
            rd /q "%PBdir%"
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

    REM --> FCLEAN Start

        :fccheck
            echo Checking if file cleaners are already installed...
            PING -n 3 127.0.0.1>nul
            if exist "%fcon%" del "%fcon%"
            if exist "%c1%" (
                echo 1st cleaner exists!
                PING -n 3 127.0.0.1>nul
                goto fcexist
            ) else (
            if exist "%c2%" (
                echo 2nd cleaner exists!
                PING -n 3 127.0.0.1>nul
                goto fcexist
            ) else (
            if exist "%c3%" (
                echo 3rd cleaner exists!
                PING -n 3 127.0.0.1>nul
                goto fcexist
            ) else ( goto fc1
            )))
        
        :fcexist
            cls
            echo 1 >fc_on
            color f2    
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                     File Cleaner Disabler
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            if exist "%c1%" echo 1. Disable 1st cleaner
            if exist "%c2%" echo 2. Disable 2nd cleaner
            if exist "%c3%" echo 3. Disable 3rd cleaner
            echo 4. Enable cleaners
            echo 0. Go back to main menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p ecln=Enter the number of choice:

            If %ecln%==1 (
                echo Disabling 1st cleaner...
                PING -n 3 127.0.0.1>nul
                goto fd1
            ) else (
            If %ecln%==2 (
                echo Disabling 2nd cleaner...
                PING -n 3 127.0.0.1>nul
                goto fd2
            ) else (
            If %ecln%==3 (
                echo Disabling 3rd cleaner...
                PING -n 3 127.0.0.1>nul
                goto fd3
            ) else (
            If %ecln%==4 (
                echo Changing menu...
                PING -n 3 127.0.0.1>nul
                goto fc1
            ) else (
            If %ecln%==0 (
                echo Skipped cleaner...
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto fcexist
            )))))

            :fd1
                del "%c1%"
                del "%fbat1%"
                del "%fbatx1%"
                goto fda
            :fd2
                del "%c2%"
                del "%fbat2%"
                del "%fbatx2%"
                goto fda
            :fd3
                del "%c3%"
                del "%fbat3%"
                del "%fbatx3%"
                goto fda
            :fda
                echo Successful! Going back to main menu...
                del "%fcon%"
                PING -n 3 127.0.0.1>nul
                goto MMenu
                

        :fc1
            cls
            color f2    
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                    What cleaner to enable?
            echo       ! The cleaners will clean your files at startup !
            echo ! The cleaners will save your settings even after disabling !
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            if not exist "%c1%" echo 1. Cleaner 1
            if not exist "%c2%" echo 2. Cleaner 2
            if not exist "%c3%" echo 3. Cleaner 3
            echo 4. Disable cleaners
            echo 0. Go back to main menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p cln=Enter the number of choice:

            If %cln%==1 (
                echo Enabling 1st cleaner...
                if not exist "%fcon%" echo 1 >fc_on
                PING -n 3 127.0.0.1>nul
                goto fcln1
            ) else (
            If %cln%==2 (
                echo Enabling 2nd cleaner...
                if not exist "%fcon%" echo 1 >fc_on
                PING -n 3 127.0.0.1>nul
                goto fcln2
            ) else (
            If %cln%==3 (
                echo Enabling 3rd cleaner...
                if not exist "%fcon%" echo 1 >fc_on
                PING -n 3 127.0.0.1>nul
                goto fcln3
            ) else (
            If %cln%==4 (
                echo Changing menu...
                PING -n 3 127.0.0.1>nul
                goto fcexist
            ) else (
            If %cln%==0 (
                echo Skipped cleaner...
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto fc1
            )))))

            :fcln1
                echo 1 >c.1
                cleanmgr /sageset:91
                cleanmgr /sagerun:91
                ( 
                    echo @echo off
                    echo ^cleanmgr /sagerun:91
                ) >fclean1.bat
                copy /y "%fbat1%" "%strtup%"
                goto fclna

            :fcln2
                echo 1 >c.2
                cleanmgr /sageset:92
                cleanmgr /sagerun:92
                ( 
                    echo @echo off
                    echo ^cleanmgr /sagerun:92
                ) >fclean2.bat
                copy /y "%fbat2%" "%strtup%"
                goto fclna

            :fcln3
                echo 1 >c.3
                cleanmgr /sageset:93
                cleanmgr /sagerun:93
                ( 
                    echo @echo off
                    echo ^cleanmgr /sagerun:93
                ) >fclean3.bat
                copy /y "%fbat3%" "%strtup%"
                goto fclna

            :fclna
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
                

    REM --> FCLEAN End

    REM --> REGEDIT Start

        :regcheck
            echo Checking if Registry Patches are already installed...
            PING -n 3 127.0.0.1>nul
            if exist "%regon%" del "%regon%"
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
            echo 1 >reg_on
            color f3
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo      Do you want to restore or modify the registry edits?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo 1. Restore
            echo 2. Modify
            echo 0. Go back to menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
            color f3
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                      Registry Restore Menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            PING -n 3 127.0.0.1>nul
            if exist "%rp1%" echo 1. Start-up programs
            if exist "%rp2%" echo 2. Desktop
            if exist "%rp3%" echo 3. Explorer
            if exist "%regon%" echo 4. Restore All
            echo 0. Back to menu...
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
                PING -n 3 127.0.0.1>nul
                del "%rd1%"
                del "%rd2%"
                del "%rd3%"
                del "%rd4%"
                del "%rp1%"
                goto rconfirm
            
            :resrm2
                reg restore "%dt%" "%ra1%" 
                PING -n 3 127.0.0.1>nul
                del "%ra1%"
                del "%rp2%"
                goto rconfirm

            :resrm3
                reg restore "%ex%" "%re1%" 
                PING -n 3 127.0.0.1>nul
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
                    if exist "%regon%" del "%regon%"
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
            color f4
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo             Do you want to apply Registry Patches?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
            color f5
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                     Registry Patcher Menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            PING -n 3 127.0.0.1>nul
            if not exist "%rp1%" echo 1. Disable all Start-up programs
            if not exist "%rp2%" echo 2. Make desktop faster
            if not exist "%rp3%" echo 3. Make explorer faster
            if not exist "%regon%" echo 4. Patch all
            echo 0. Go back to main menu
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                 !NOTE: Reboot after applying!
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rmm=Enter the number of choice:

            If %rmm%==1 (
                PING -n 3 127.0.0.1>nul
                set rmall=0
                if exist "%rp1%" goto rong
                goto regp1
            ) else (
            If %rmm%==2 (
                PING -n 3 127.0.0.1>nul
                set rmall=0
                if exist "%rp2%" goto rong
                goto regp2
            ) else (
            If %rmm%==3 (
                PING -n 3 127.0.0.1>nul
                set rmall=0
                if exist "%rp3%" goto rong
                goto regp3
            ) else (
            If %rmm%==4 (
                PING -n 3 127.0.0.1>nul
                set rmall=1
                goto regp1y
            ) else (
            If %rmm%==0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regmenu
            )))))
        
        :rong
            echo Unknown value input! Please retry
            PING -n 3 127.0.0.1>nul
            goto regmenu

        :regp1 
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo         Do you want to disable all start-up programs?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rp1=Yes(1) or No(0)?

            If %rp1%==1 (
                :regp1y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.1
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
                if %rmall%==1 (
                    goto regp2y
                ) else ( goto MMenu
                )
            ) else (
            If %rp1%==0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regp1
            ))
        
        :regp2 
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo       Do you want to add tweaks to make desktop faster?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo    !This will put stricter restrictions to applications!
            echo              !and remove visual animations!
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rp2=Yes(1) or No(0)?

            If %rp2%==1 (
                :regp2y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.2
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
                if %rmall%==1 (
                    goto regp3y
                ) else ( goto MMenu
                )
            ) else (
            If %rp2%==0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regp2
            ))

        :regp3
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo    Do you want to add tweaks to make file explorer faster?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo            !This will disable various properties!
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rp3=Yes(1) or No(0)?

            If %rp3%==1 (
                :regp3y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.3
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
                goto MMenu
            ) else (
            If %rp3%==0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto regp3
            ))

    REM --> REGEDIT End       

    REM --> RAMOPS Start

        :ramcheck
            echo Checking if RAM Optimizer is already enabled...
            PING -n 6 127.0.0.1>nul
            if exist "%ron%" goto ramexist
            if not exist "%ron%" goto ram1

        :ramexist
            color f3
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            REM --> for rcls
            if exist "%rc1%" echo RamOps enabled for 512MB RAM
            if exist "%rc2%" echo RamOps enabled for 1GB RAM
            if exist "%rc3%" echo RamOps enabled for 2GB RAM
            if exist "%rc4%" echo RamOps enabled for 4GB+ RAM
            REM --> for rte
            if exist "%rt1%" echo RamOps scheduled every 1 hour
            if exist "%rt2%" echo RamOps scheduled every 3 hours
            if exist "%rt3%" echo RamOps scheduled every 5 hours
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo        Do you want to change or disable RAM Optimizer?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
            color f3
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo             Do you want to enable RAM Optimizer?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo                   How much RAM do you have?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo       How often do you want to execute the optimizer?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
            echo FreeMem=Space(%rm%) >rboost.vbs
            schtasks /create /tn "RAM Optimizer" /tr "%rvbs%" /mo %rtm% /sc hourly 
            echo boostrm=%rcln% >rc.%rcln%
            echo boosttime=%rtx% >rt.%rtx%
            echo nul >r_on
            echo Successful! Going back to menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

    REM --> RAMOPS End

    REM --> REMBLT Start

        :bltchk
            echo Checking if bloatwares was previously removed...
            if exist "%PBblt%" goto bltmenu
            if not exist "%PBblt%" goto blt1

        :bltmenu
            echo ! Bloatwares had been previously removed !
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo               Do you want to remove them again?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p bltm=Yes(1) or No(0)?

            If %bltm%==1 (
                echo Proceeding to bloatware remover...
                del "%PBblt%"
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ) else (
            If %bltm%==0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto bltmenu
            ))

        :blt1   
            color f1
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo  Do you want to remove pre-installed bloatware applications?
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rmv=Yes(1) or No(0)?

            If %rmv%==1 (
                echo Proceeding to uninstall...
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ) else (
            If %rmv%==0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto bltmenu
            ))
        
        :rmv1
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            echo      Are you sure? This could take at least 10 minutes...
            echo  The program will go back to main menu after uninstalling all
            echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            set /p rmv=Yes(1) or No(0)?

            If %rmv%==1 (
                goto rmx
            ) else (
            If %rmv%==0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto rmv1
            ))

        :rmx
            echo Creating list of apps to be removed...
            REM --> List
            (
                echo List of apps to be removed
                echo ^%b1%
                echo ^%b2%
                echo ^%b3%
                echo ^%b4%
                echo ^%b5%
                echo ^%b6%
                echo ^%b7%
                echo ^%b8%
                echo ^%b9%
                echo ^%b10%
                echo ^%b11x%
                echo ^%b12%
                echo ^%b13%
                echo ^%b14%
                echo ^%b15%
                echo ^%b16%
                echo ^%b17%
                echo ^%b18%
                echo ^%b19%
                echo ^%b20%
                echo ^%b21%
                echo ^%b22%
            ) >%bltlist%
            copy %bltlist% "%PBblt%" >nul
            PING -n 3 127.0.0.1>nul

        :bltchoice
            cls
            echo !FINAL WARNING!
            set /p bltx=Are you sure to proceed? Yes (1) or No (0)

            If %bltx%==1 (
                goto bltwr1
            ) else (
            If %bltx%==0 (
                goto bltwr0
            ) else ( echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto bltchoice
            ))

        :bltwr0
            del "%PBblt%"
            echo Cancelled... Going back to main menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

        :bltwr1
            REM --> Removing of bloatware start
            cls
            echo Removing %b1%...
            wmic product where name=%b1% call uninstall /nointeractive
            echo Removing %b2%...
            wmic product where name=%b2% call uninstall /nointeractive
            echo Removing %b3%...
            wmic product where name=%b3% call uninstall /nointeractive
            echo Removing %b4%...
            wmic product where name=%b4% call uninstall /nointeractive
            echo Removing %b5%...
            wmic product where name=%b5% call uninstall /nointeractive
            echo Removing %b6%...
            wmic product where name=%b6% call uninstall /nointeractive
            echo Removing %b7%...
            wmic product where name=%b7% call uninstall /nointeractive
            echo Removing %b8%...
            wmic product where name=%b8% call uninstall /nointeractive
            echo Removing %b9%...
            wmic product where name=%b9% call uninstall /nointeractive
            echo Removing %b10%...
            wmic product where name=%b10% call uninstall /nointeractive
            echo Removing %b11x%...
            wmic product where name=%b11% call uninstall /nointeractive
            echo Removing %b12%...
            wmic product where name=%b12% call uninstall /nointeractive
            echo Removing %b13%...
            wmic product where name=%b13% call uninstall /nointeractive
            echo Removing %b14%...
            wmic product where name=%b14% call uninstall /nointeractive
            echo Removing %b15%...
            wmic product where name=%b15% call uninstall /nointeractive
            echo Removing %b16%...
            wmic product where name=%b16% call uninstall /nointeractive
            echo Removing %b17%...
            wmic product where name=%b17% call uninstall /nointeractive
            echo Removing %b18%...
            wmic product where name=%b18% call uninstall /nointeractive
            echo Removing %b19%...
            wmic product where name=%b19% call uninstall /nointeractive
            echo Removing %b20%...
            wmic product where name=%b20% call uninstall /nointeractive
            echo Removing %b21%...
            wmic product where name=%b21% call uninstall /nointeractive
            echo Removing %b22%...
            wmic product where name=%b22% call uninstall /nointeractive

            REM --> Removing of bloatware end
            echo Successful! Proceeding back to main menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

    REM --> REMBLT End

        :bltchk

REM --> Modules End

REM --> ROLES

REM --> @Ronwell Carl Langit and @Isma Garcia
REM --> files cleaner, and disk checker and fixer

REM --> @Luis Gabriel Palacios @Jude Mendoza Duqueza and @Mark Quinto 
REM --> DNS Configurator and remove bloatwares

REM --> End code
goto prg
