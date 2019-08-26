@echo off
:prg

:: This program was made by the LIMEJR Research Group as an Investigatory Project
:: Mainly developed by Edrick Vince C. Sinsuan
:: Methods researched and tested by the Research Group
:: The development of the code can be spectated at:
:: https://github.com/DeadRoEd/batch

Title Performance Optimizer %ver%
mode con: cols=62 lines=25

color f0
set ver=v1_r3

:: BatchGotAdmin
    :-------------------------------------
    REM  --> Check for permissions
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

    :: If error flag set, we do not have admin.
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
:: BatchGotAdmin

:: Start Start

    echo --------------------------------------------------------------
    echo --------------------------------------------------------------
    echo                         Please wait...
    echo --------------------------------------------------------------
    echo --------------------------------------------------------------

    :startup
        echo Preparing variables needed...
        :: Directories
        set POdir=%WINDIR%\PO
        set Dsktp=%USERPROFILE%\Desktop
        set strtup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
        set po=%POdir%\PO.bat

        set fdir=%POdir%\fcleaner
        set rdir=%POdir%\ram
        set cddir=%POdir%\chkdsk
        set regdir=%POdir%\reg
        set regbup=%regdir%\backups
        set dnsdir=%POdir%\dns

        goto dircheck

    :dircheck
        echo Creating program directories...
        if not exist "%POdir%" (
            md "%POdir%"
        )
        if not exist "%fdir%" (
            md "%fdir%"
        )
        if not exist "%rdir%" (
            md "%rdir%"
        )
        if not exist "%cddir%" (
            md "%cddir%"
        )
        if not exist "%regdir%" (
            md "%regdir%"
        )
        if not exist "%regbup%" (
            md "%regbup%"
        )
        if not exist "%dnsdir%" (
            md "%dnsdir%"
        )

        goto start

    :start
        echo Setting program environment...
    :: Program props
        set m1=1. Files Cleaner
        set m2=2. RAM Cleaner
        set m3=3. Registry Patcher
        set m4=4. Main Disk Checker and Fixer
        set m5=5. DNS Configurator
        set m6=6. Remove bloatwares
        set on=!
        set off=#

    :: Copy program
        copy PO.bat "%po%" >nul

    :: FCLEAN
        set fcon=%fdir%\fc_on
        set sgset=sageset:90
        set sgrun=sagerun:90
        set fname=fclean.bat
        set fbat=%fdir%\fclean.bat
    :: FCLEAN check
        set sched1=%fdir%\fsched.1
        set sched2=%fdir%\fsched.2
        set sched3=%fdir%\fsched.3
        
    :: REGEDIT
        set regon=%regdir%\reg_on
        set rp1=%regdir%\rp.1
        set rp2=%regdir%\rp.2
        set rp3=%regdir%\rp.3
        set rp4=%regdir%\rp.4
    :: Local Machine
        set lmr=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
        set lmo=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
        set rd1=%regbup%\lmr.hiv
        set rd2=%regbup%\lmo.hiv
    :: Current User
        set cur=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
        set cuo=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce        
        set rd3=%regbup%\cur.hiv
        set rd4=%regbup%\cuo.hiv
    :: Desktop
        set dt=HKCU\Control Panel\Desktop
        set ra1=%regbup%\dt.hiv
    :: Explorer
        set ex=HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
        set re1=%regbup%\ex.hiv
    :: Memory Management
        set mem=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management
        set ru1=%regbup%\mem.hiv
    
    :: RAMOPS
        set rvbs=%rdir%\rboost.vbs
        set ron=%rdir%\r_on
        set rc1=%rdir%\rc.1
        set rc2=%rdir%\rc.2
        set rc3=%rdir%\rc.3
        set rc4=%rdir%\rc.4
        set rt1=%rdir%\rt.1
        set rt2=%rdir%\rt.2
        set rt3=%rdir%\rt.3
        set rt4=%rdir%\rt.4

    :: DSKCHK
        set cdonly=chkonly.bat
        set cdoboot=%strtup%\%cdonly%
        set cdf=chkf.bat
        set cdfboot=%strtup%\%cdf%

    :: DNS
        set dnson=%dnsdir%\dns_on
        set dns1=1.1.1.1
        set d1name=Cloudflare DNS
        set dns1s=1.0.0.1
        set d1on=%dnsdir%\dns.1
        set dns2=8.8.8.8
        set d2name=Google DNS
        set dns2s=8.8.4.4
        set d2on=%dnsdir%\dns.2
        set dns3=9.9.9.9
        set d3name=Quad9 DNS
        set dns3s=149.112.112.112
        set d3on=%dnsdir%\dns.3

    :: REMBLT
        set bltlist=removedbltwrs.txt
        set POblt=%POdir%\%bltlist%
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

:: Start End

:: Menu Start
    
    :MMenu
        cls
        echo --------------------------------------------------------------
        echo --------------------------------------------------------------
        echo                         Please wait...
        echo --------------------------------------------------------------
        echo --------------------------------------------------------------
        start "" "%po%"
        PING -n 3 127.0.0.1>nul
        exit 

    :MMenu2
        cd %POdir%
        cls
        color f1
        echo --------------------------------------------------------------
        echo                     Performance Optimizer
        echo --------------------------------------------------------------
        echo Version: %ver%
        echo --------------------------------------------------------------
        echo %on% = Enabled / Executed
        echo %off% = Disabled / Not Executed
        echo --------------------------------------------------------------

        :fchk
        goto fccheckm

        :rchk
        goto ramcheckm

        :regchk
        goto regcheckm

        :dchk
        goto diskcheckm

        :dschk
        goto dnscheckm

        :rbchk
        goto bltchkm

        :mcon
        echo 0. Clean and Exit
        echo --------------------------------------------------------------
        echo   ! Do not close the window using the one on the top right !
        echo   ! It is recommended to reboot for changes to take place !
        echo --------------------------------------------------------------
        set /p mm=Please enter the number of choice then press ENTER: 
        
        If %errorlevel% equ 1 goto menurong
        If %mm% equ 0 (
            goto x
        ) else (
        If %mm% equ 1 (
            goto cln
        ) else (
        If %mm% equ 2 (
            goto ram
        ) else (
        If %mm% equ 3 (
            goto rgp
        ) else (
        If %mm% equ 4 (
            goto dskchk
        ) else (
        If %mm% equ 5 (
            goto dnsc
        ) else (
        If %mm% equ 6 (
            goto rmv
        ) else ( 
            :menurong
            echo Unknown value input! Please retry
            PING -n 3 127.0.0.1>nul
            goto MMenu 
        )))))))
    
    :fccheckm
        if exist "%fcon%" (
            echo %m1% %on%
            goto rchk
        ) else ( 
            echo %m1% %off%
            goto rchk
        )

    
    :ramcheckm
        if exist "%ron%" (
            echo %m2% %on%
            goto regchk
        ) else ( 
            echo %m2% %off%
            goto regchk
        )

    :regcheckm
        if exist "%rp1%" (
            echo %m3% %on%
            goto dchk
        ) else (
        if exist "%rp2%" (
            echo %m3% %on%
            goto dchk
        ) else (
        if exist "%rp3%" (
            echo %m3% %on%
            goto dchk
        ) else ( 
        if exist "%rp4%" (
            echo %m3% %on%
            goto dchk
        ) else ( 
            echo %m3% %off%
            goto dchk
        ))))

    :diskcheckm
        if exist "%cdoboot%" (
            echo %m4% %on% at boot
            goto dschk
        ) else (
        if exist "%cdfboot%" (
            echo %m4% %on% at boot
            goto dschk
        ) else ( 
            echo %m4% %off%
            goto dschk
        ))

    :dnscheckm
        if exist "%dnson%" (
            echo %m5% %on%
            goto rbchk
        ) else (
            echo %m5% %off%
            goto rbchk
        )

        echo %m5% %off%
        goto rbchk
    
    :bltchkm
        if exist "%PBblt%" (
            echo %m6% %on%
            goto mcon
        ) else ( 
            echo %m6% %off%
            goto mcon
        )

:: Menu End

:: Redirectors Start

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
        cd %cddir%
        goto chkdskx

    :dnsc
        cls
        cd %dnsdir%
        goto dnschk

    :rmv
        cls
        cd %Dsktp%
        goto bltchk

    :x
        cls
        color f0
        echo --------------------------------------------------------------
        echo              Are you sure to close the program?
        echo --------------------------------------------------------------
        set /p close=Type 1 if yes, 0 if no:
        
        If %errorlevel% equ 1 goto xrong
        If %close% equ 1 (
            del "%po%"
            rd /q "%dnsdir%"
            rd /q "%regbup%"
            rd /q "%regdir%"
            rd /q "%fdir%"
            rd /q "%cddir%"
            rd /q "%rdir%"
            rd /q "%POdir%"
            exit
        ) else (
        If %close% equ 0 (
            goto MMenu
        ) else (
            :xrong
            echo Unknown value input! Please retry
            PING -n 3 127.0.0.1>nul
            goto x
        ))

:: Redirectors End

:: Modules Start

    :: FCLEAN Start

        :fccheck
            echo Checking if file cleaners are already installed...
            PING -n 3 127.0.0.1>nul
            if exist "%fcon%" (
                echo A cleaner exists!
                PING -n 3 127.0.0.1>nul
                goto fc1
            ) else ( 
                goto fc1
            )
        
        :fcexist
            cls
            color f2    
            echo --------------------------------------------------------------
            echo                     File Cleaner Menu
            echo --------------------------------------------------------------
            if exist "%fcon%" echo 1. Disable cleaner
            echo 2. Modify
            echo 0. Go back to main menu
            echo --------------------------------------------------------------
            set /p ecln=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto ecrong
            If %ecln% equ 1 (
                if not exist "%fcon%" goto ecrong
                echo Disabling cleaner...
                PING -n 3 127.0.0.1>nul
                goto fd
            ) else (
            If %ecln% equ 2 (
                echo Changing menu...
                PING -n 3 127.0.0.1>nul
                goto fc1
            ) else (
            If %ecln% equ 0 (
                echo Skipped cleaner...
                goto MMenu
            ) else ( 
                :ecrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto fcexist
            )))

            :fd
                schtasks /delete /tn "File Cleaner" /f
                del /f /q *
                goto fda
            :fda
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
                

        :fc1
            cls
            color f3
            echo --------------------------------------------------------------
            echo                      File Cleaner Menu
            echo  ! The cleaner will save your settings even after disabling !
            echo --------------------------------------------------------------
            echo Current Setting:
            goto fschk
            :fschkx
            echo --------------------------------------------------------------            
            echo 1. Set Cleaner Preset
            echo 2. Run Cleaner Now
            if exist "%fcon%" echo 3. Disable cleaner
            echo 0. Go back to main menu
            echo --------------------------------------------------------------
            set /p cln=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto crong
            If %cln% equ 1 (
                echo Setting cleaning preset...
                PING -n 3 127.0.0.1>nul
                goto fclnx
            ) else (
            If %cln% equ 2 (
                echo Running cleaner now...
                PING -n 3 127.0.0.1>nul
                goto fcrun
            ) else (
            If %cln% equ 3 (
                echo Changing menu...
                PING -n 3 127.0.0.1>nul
                goto fcexist
            ) else (
            If %cln% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :crong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto fc1
            ))))

            :fschk
                if exist "%fcon%" (
                    echo ! Enabled !
                    goto fschk2
                ) else (
                    echo ! Disabled !
                    goto fschk2
                )
            
            :fschk2
                if exist "%sched1%" (
                    echo ! Daily !
                    goto fschkx
                ) else (
                if exist "%sched2%" (
                    echo ! Weekly !
                    goto fschkx
                ) else (
                if exist "%sched3%" (
                    echo ! Monthly !
                    goto fschkx
                ) else (
                    goto fschkx
                )))

            :fclnx
                cls
                color f2    
                echo --------------------------------------------------------------
                echo          How often do you want the cleaner to be ran?
                echo --------------------------------------------------------------
                if not exist "%sched1%" echo 1. Daily
                if not exist "%sched2%" echo 2. Weekly
                if not exist "%sched3%" echo 3. Monthly
                echo 4. Go back to cleaner menu
                echo 0. Go back to main menu
                echo --------------------------------------------------------------
                set /p schx=Please enter the number of choice then press ENTER: 

                If %errorlevel% equ 1 goto schrong
                If %schx% equ 1 (
                    If not exist "%fcon%" echo 1 >fc_on
                    if exist "%sched2%" del "%sched2%"
                    if exist "%sched3%" del "%sched3%"
                    echo 1 >fsched.1
                    set sched=daily
                    echo Setting daily...
                    PING -n 3 127.0.0.1>nul
                    goto schedx
                ) else (
                If %schx% equ 2 (
                    If not exist "%fcon%" echo 1 >fc_on
                    if exist "%sched1%" del "%sched1%"
                    if exist "%sched3%" del "%sched3%"
                    echo 1 >fsched.2
                    set sched=weekly
                    echo Setting weekly...
                    PING -n 3 127.0.0.1>nul
                    goto schedx
                ) else (
                If %schx% equ 3 (
                    If not exist "%fcon%" echo 1 >fc_on
                    if exist "%sched2%" del "%sched2%"
                    if exist "%sched1%" del "%sched1%"
                    echo 1 >fsched.3
                    set sched=monthly
                    echo Setting monthly...
                    PING -n 3 127.0.0.1>nul
                    goto schedx
                ) else (
                If %schx% equ 4 (
                    echo Going back to cleaner menu...
                    PING -n 3 127.0.0.1>nul
                    goto fc1
                ) else ( 
                If %schx% equ 0 (
                    echo Going back to main menu...
                    PING -n 3 127.0.0.1>nul
                    goto MMenu
                ) else ( 
                    :schrong
                    echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto fclnx
                )))))

            :schedx
                cleanmgr /%sgset%
                (
                    echo @echo off
                    echo File Cleaner created by Performance Optimizer
                    echo ^cleanmgr /%sgrun%
                ) >%fname%
                schtasks /create /tn "File Cleaner" /tr "%fbat%" /sc "%sched%" /f
                goto fclna               
                
            :fcrun 
                cls
                echo --------------------------------------------------------------
                echo Do you want to run it now?
                echo --------------------------------------------------------------
                set /p sgx=Type 1 if yes, 0 if no:

                If %errorlevel% equ 1 goto fxrong
                If %sgx% equ 1 (
                    cleanmgr /%sgrun%
                    goto fclna
                ) else (
                If %sgx% equ 0 (
                    echo Cancelled! Going back to menu...
                    PING -n 3 127.0.0.1>nul
                    goto fc1
                ) else ( 
                    :fxrong
                    echo Unknown value input! Please retry
                    PING -n 3 127.0.0.1>nul
                    goto fclnx
                ))

            :fclna
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
                

    :: FCLEAN End

    :: RAMOPS Start

        :ramcheck
            echo Checking if RAM Optimizer is already enabled...
            PING -n 6 127.0.0.1>nul
            if exist "%ron%" goto ramexist
            if not exist "%ron%" goto ram1

        :ramexist
            cls
            color f3
            echo --------------------------------------------------------------
            :: for rcls
            if exist "%rc1%" echo RamOps enabled for 512MB RAM
            if exist "%rc2%" echo RamOps enabled for 1GB RAM
            if exist "%rc3%" echo RamOps enabled for 2GB RAM
            if exist "%rc4%" echo RamOps enabled for 4GB+ RAM
            :: for rte
            if exist "%rt1%" echo RamOps scheduled every 30 minutes
            if exist "%rt2%" echo RamOps scheduled every 1 hour
            if exist "%rt3%" echo RamOps scheduled every 2 hours
            if exist "%rt4%" echo RamOps scheduled every 3 hours
            echo --------------------------------------------------------------

            echo --------------------------------------------------------------
            echo        Do you want to change or disable RAM Optimizer?
            echo --------------------------------------------------------------
            set /p ram=Type 1 to Change, 2 to Disable, 0 to Cancel:
            
            If %errorlevel% equ 1 goto raong
            If %ram% equ 1 (
                schtasks /delete /tn "RAM Optimizer" /f
                del /f /q *
                goto rclean
            ) else (
            If %ram% equ 2 (
                schtasks /delete /tn "RAM Optimizer" /f
                del /f /q *
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %ram% equ 0 (
                goto MMenu
            ) else ( 
                :raong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto ramexist
            )))

        :ram1
            cls
            color f3
            echo --------------------------------------------------------------
            echo             Do you want to enable RAM Optimizer?
            echo --------------------------------------------------------------
            set /p ram=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto ra1ong
            If %ram% equ 1 (
                goto rclean
            ) else (
            If %ram% equ 0 (
                goto MMenu
            ) else ( 
                :ra1ong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto ram 
            ))

        :rclean
            cls
            echo --------------------------------------------------------------
            echo                   How much RAM do you have?
            echo --------------------------------------------------------------
            echo 1. 512MB
            echo 2. 1GB
            echo 3. 2GB
            echo 4. 4GB+
            echo 0. Go back to main menu...
            echo --------------------------------------------------------------
            set /p rcln=Enter the number of choice then press ENTER:
            
            If %errorlevel% equ 1 goto racrong
            If %rcln% equ 1 (
                set rm=51200000
                echo Setting .vbs script for 512MB RAM...
                goto rtime
            ) else (
            If %rcln% equ 2 (
                set rm=102400000
                echo Setting .vbs script for 1GB RAM...
                goto rtime
            ) else (
            If %rcln% equ 3 (
                set rm=204800000
                echo Setting .vbs script for 2GB RAM...
                goto rtime
            ) else (
            If %rcln% equ 4 (
                set rm=409600000
                echo Setting .vbs script for 4GB+ RAM...
                goto rtime
            ) else (
            If %rcln% equ 0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :racrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto rclean
            )))))

        :rtime
            cls
            echo --------------------------------------------------------------
            echo       How often do you want to execute the optimizer?
            echo --------------------------------------------------------------
            echo Every:
            echo 1. 30 minutes
            echo 2. 1 hour
            echo 3. 2 hours
            echo 4. 3 hours
            echo 0. Go back to previous selection...
            echo --------------------------------------------------------------
            set /p rtx=Enter the number of choice then press ENTER:
            
            If %errorlevel% equ 1 goto rtrong
            If %rtx% equ 1 (
                set rtm=30
                set rts=minute
                echo Scheduling the task every 30 minutes...
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx% equ 2 (
                set rtm=1
                set rts=hourly
                echo Scheduling the task every 1 hour...
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx% equ 3 (
                set rtm=2
                set rts=hourly
                echo Scheduling the task every 2 hours...
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx% equ 3 (
                set rtm=3
                set rts=hourly
                echo Scheduling the task every 3 hours...
                PING -n 3 127.0.0.1>nul
                goto rexecute
            ) else (
            If %rtx% equ 0 (
                echo Going back...
                PING -n 3 127.0.0.1>nul
                goto rclean
            ) else ( 
                :rtrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto rtime
            )))))

        :rexecute
            echo FreeMem=Space(%rm%) >rboost.vbs
            schtasks /create /tn "RAM Optimizer" /tr "%rvbs%" /mo %rtm% /sc %rts%
            echo boostrm=%rcln% >rc.%rcln%
            echo boosttime=%rtx% >rt.%rtx%
            echo 1 >r_on
            echo Successful! Going back to menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

    :: RAMOPS End

    :: REGEDIT Start

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
            ) else ( 
            if exist "%rp4%" (
                goto regexist
            ) else ( 
                goto reg1
            ))))

        :regexist
            cls
            echo 1 >reg_on
            color f3
            echo --------------------------------------------------------------
            echo      Do you want to restore or modify the registry edits?
            echo --------------------------------------------------------------
            echo Registry Edits:
            if exist "%rp1%" echo ! Start-up programs disabled ! 
            if exist "%rp2%" echo ! Stricter app killing !
            if exist "%rp3%" echo ! Disabled explorer features (faster) !
            if exist "%rp4%" echo ! Modified memory management !
            echo --------------------------------------------------------------
            echo 1. Restore
            echo 2. Modify
            echo 0. Go back to menu
            echo --------------------------------------------------------------
            set /p resreg=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto rgrong
            If %resreg% equ 1 (
                goto regresmenu
            ) else (
            If %resreg% equ 2 (
                goto regmenu
            ) else (
            If %resreg% equ 0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :rgrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regexist
            )))
        
        :regresmenu
            cls
            color f3
            echo --------------------------------------------------------------
            echo                      Registry Restore Menu
            echo --------------------------------------------------------------
            if exist "%rp1%" echo 1. Start-up programs
            if exist "%rp2%" echo 2. Desktop
            if exist "%rp3%" echo 3. Explorer
            if exist "%rp4%" echo 4. Memory Management
            if exist "%regon%" echo 5. Restore All
            echo 0. Back to menu...
            echo --------------------------------------------------------------
            set /p resrm=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto resong
            If %resrm% equ 1 (
                set rall=0
                if not exist "%rp1%" goto resong
                goto resrm1
            ) else (
            If %resrm% equ 2 (
                set rall=0
                if not exist "%rp2%" goto resong
                goto resrm2
            ) else (
            If %resrm% equ 3 (
                set rall=0
                if not exist "%rp3%" goto resong
                goto resrm3
            ) else (
            If %resrm% equ 4 (
                set rall=0
                if not exist "%rp4%" goto resong
                goto resrm4
            ) else (
            If %resrm% equ 5 (
                set rall=1
                if exist "%rp1%" goto rconfirm
                if exist "%rp2%" goto rconfirm
                if exist "%rp3%" goto rconfirm
                if exist "%rp4%" goto rconfirm
                goto resong
            ) else (
            If %resrm% equ 0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :resong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regresmenu
            ))))))

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

            :resrm4
                reg restore "%mem%" "%ru1%" 
                PING -n 3 127.0.0.1>nul
                del "%ru1%"
                del "%rp4%"
                goto rconfirm

            :rconfirm
                if %rall% equ 1 (
                    if exist "%rp1%" goto resrm1
                    if not exist "%rp1%" echo Done!
                    if exist "%rp2%" goto resrm2
                    if not exist "%rp2%" echo Done!
                    if exist "%rp3%" goto resrm3
                    if not exist "%rp3%" echo Done!
                    if exist "%rp4%" goto resrm4
                    if not exist "%rp4%" echo Done!
                    if exist "%regon%" del "%regon%"
                    echo Successful! Now going back to main menu...
                    PING -n 3 127.0.0.1>nul 
                    goto MMenu
                ) else ( 
                    echo Successful! Now going back to main menu...
                    PING -n 3 127.0.0.1>nul 
                    goto resregcheck
                )
            
            :resregcheck
                if exist "%regon%" del "%regon%"
                PING -n 3 127.0.0.1>nul
                if exist "%rp1%" (
                    goto regresmenu
                ) else (
                if exist "%rp2%" (
                    goto regresmenu
                ) else (
                if exist "%rp3%" (
                    goto regresmenu
                ) else ( 
                if exist "%rp4%" (
                    goto regresmenu
                ) else ( 
                    goto MMenu
                ))))

        :reg1
            cls
            color f4
            echo --------------------------------------------------------------
            echo             Do you want to apply Registry Patches?
            echo --------------------------------------------------------------
            set /p rgp=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto rg1rong
            If %rgp% equ 1 (
                goto regmenu
            ) else (
            If %rgp% equ 0 (
                goto MMenu
            ) else ( 
                :rg1rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto reg1
            ))

        :regmenu
            cls
            color f5
            echo --------------------------------------------------------------
            echo                     Registry Patcher Menu
            echo --------------------------------------------------------------
            if not exist "%rp1%" echo 1. Disable all Start-up programs
            if not exist "%rp2%" echo 2. Make desktop faster
            if not exist "%rp3%" echo 3. Make explorer faster
            if not exist "%rp4%" echo 4. Modify Memory Management
            if not exist "%regon%" echo 5. Patch all
            echo 0. Go back to main menu
            echo --------------------------------------------------------------
            echo                 !NOTE: Reboot after applying!
            echo --------------------------------------------------------------
            set /p rmm=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto rong
            If %rmm% equ 1 (
                set rmall=0
                if exist "%rp1%" goto rong
                goto regp1
            ) else (
            If %rmm% equ 2 (
                set rmall=0
                if exist "%rp2%" goto rong
                goto regp2
            ) else (
            If %rmm% equ 3 (
                set rmall=0
                if exist "%rp3%" goto rong
                goto regp3
            ) else (
            If %rmm% equ 4 (
                set rmall=0
                if exist "%rp4%" goto rong
                goto regp4
            ) else (
            If %rmm% equ 5 (
                set rmall=1
                goto regp1y
            ) else (
            If %rmm% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regmenu
            ))))))

        :regp1 
            cls
            echo --------------------------------------------------------------
            echo         Do you want to disable all start-up programs?
            echo --------------------------------------------------------------
            set /p rp1=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto strtong
            If %rp1% equ 1 (
                :regp1y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.1
                :: Backup
                reg save "%lmr%" "%rd1%" /y
                reg save "%lmo%" "%rd2%" /y
                reg save "%cur%" "%rd3%" /y
                reg save "%cuo%" "%rd4%" /y
                :: Deletion
                reg delete "%lmr%" /va /f
                reg delete "%lmo%" /va /f
                reg delete "%cur%" /va /f
                reg delete "%cuo%" /va /f
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                if %rmall% equ 1 (
                    goto regp2y
                ) else ( 
                    goto MMenu
                )
            ) else (
            If %rp1% equ 0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :strtong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regp1
            ))
        
        :regp2 
            cls
            echo --------------------------------------------------------------
            echo       Do you want to add tweaks to make desktop faster?
            echo --------------------------------------------------------------
            echo    ! This will put stricter restrictions to applications !
            echo              ! and reduce visual animations !
            echo --------------------------------------------------------------
            set /p rp2=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto dskrong
            If %rp2% equ 1 (
                :regp2y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.2
                :: Backup
                reg save "%dt%" "%ra1%" /y
                :: Addition
                reg add "%dt%" /v AutoEndTasks /t REG_SZ /d 1 /f
                reg add "%dt%" /v HungAppTimeout /t REG_SZ /d 1000 /f
                reg add "%dt%" /v MenuShowDelay /t REG_SZ /d 8 /f
                reg add "%dt%" /v WaitToKillAppTimeout /t REG_SZ /d 10000 /f
                reg add "%dt%" /v LowLevelHooksTimeout /t REG_SZ /d 1000 /f
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                if %rmall% equ 1 (
                    goto regp3y
                ) else ( 
                    goto MMenu
                )
            ) else (
            If %rp2% equ 0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :dskrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regp2
            ))

        :regp3
            cls
            echo --------------------------------------------------------------
            echo    Do you want to add tweaks to make file explorer faster?
            echo --------------------------------------------------------------
            echo            !This will disable various properties!
            echo --------------------------------------------------------------
            set /p rp3=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto fexong
            If %rp3% equ 1 (
                :regp3y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.3
                :: Backup
                reg save "%ex%" "%re1%" /y
                :: Addition
                reg add "%ex%" /v NoLowDiskSpaceChecks /t REG_DWORD /d 1 /f
                reg add "%ex%" /v LinkResolveIgnoreLinkInfo /t REG_DWORD /d 1 /f
                reg add "%ex%" /v NoResolveSearch /t REG_DWORD /d 1 /f
                reg add "%ex%" /v NoResolveTrack /t REG_DWORD /d 1 /f
                reg add "%ex%" /v NoInternetOpenWith /t REG_DWORD /d 1 /f
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                if %rmall% equ 1 (
                    goto regp4y
                ) else ( 
                    goto MMenu
                )
                goto MMenu
            ) else (
            If %rp3% equ 0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :fexong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regp3
            ))

        :regp4
            cls
            echo --------------------------------------------------------------
            echo           Do you want to modify memory management?
            echo --------------------------------------------------------------
            echo     ! This will disable and enable various properties !
            echo --------------------------------------------------------------
            set /p rp4=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto memong
            If %rp4% equ 1 (
                :regp4y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.4
                :: Backup
                reg save "%mem%" "%ru1%" /y
                :: Addition
                reg add "%mem%" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f
                reg add "%mem%" /v DisablePagingExecutive /t REG_DWORD /d 1 /f
                reg add "%mem%" /v LargeSystemCache /t REG_DWORD /d 0 /f
                reg add "%mem%" /v NonPagedPoolQuota  /t REG_DWORD /d 0 /f
                reg add "%mem%" /v PagedPoolQuota /t REG_DWORD /d 0 /f
                reg add "%mem%" /v SessionPoolSize /t REG_DWORD /d 30 /f
                reg add "%mem%" /v SessionViewSize /t REG_DWORD /d 60 /f
                reg add "%mem%" /v SystemPages /t REG_DWORD /d 0 /f
                reg add "%mem%" /v PoolUsageMaximum /t REG_DWORD /d 60 /f
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                goto MMenu
            ) else (
            If %rp4% equ 0 (
                echo Cancelled. Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :memong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regp4
            ))

    :: REGEDIT End       

    :: DSKCHK Start

        :chkdskx
            cls
            color f5
            echo --------------------------------------------------------------
            echo             How do you wish to check main C: disk?
            echo --------------------------------------------------------------
            echo 1. Check only
            echo 2. Check and fix 
            if not exist "%cdoboot%" echo 3. Check at boot
            if not exist "%cdfboot%" echo 4. Check and fix at boot
            if exist "%cdoboot%" echo 5. Remove at boot batch files
            if exist "%cdfboot%" echo 5. Remove at boot batch files
            echo 0. Back to main menu
            echo --------------------------------------------------------------
            set /p chkx=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto chrong
            If %chkx% equ 1 (
                goto chk1
            ) else (
            If %chkx% equ 2 (
                goto chk2
            ) else (
            If %chkx% equ 3 (
                if exist "%cdoboot%" goto chrong
                goto chk3
            ) else (
            If %chkx% equ 4 (
                if exist "%cdfboot%" goto chrong
                goto chk4
            ) else (
            If %chkx% equ 5 (
                if exist "%cdoboot%" goto chk5
                if exist "%cdfboot%" goto chk5
                goto chrong
            ) else (
            If %chkx% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :chrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto chkdskx
            ))))))

        :chk1
            cls
            echo --------------------------------------------------------------
            echo      Are you sure? This could take at least 10 minutes...
            echo  The program will go back to main menu after checking disk
            echo --------------------------------------------------------------
            set /p rmv=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto ckrong
            If %rmv% equ 1 (
                echo Checking C: disk...
                chkdsk C:
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :ckrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto chk1
            ))
        
        :chk2
            cls
            echo --------------------------------------------------------------
            echo      Are you sure? This could take at least 15 minutes...
            echo   The program will go back to main menu after the operation
            echo --------------------------------------------------------------
            set /p rmv=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto ck2rong
            If %rmv% equ 1 (
                echo Checking and fixing C: disk...
                chkdsk C: /f
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :ck2rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto chk2
            ))

        :chk3
            cls
            echo --------------------------------------------------------------
            echo   This will create a bat file that will check disk at boot 
            echo             ! Can be disabled after applying !
            echo         ! This will remove check and fix at boot !
            echo --------------------------------------------------------------
            set /p rmv=Type 1 to apply, 0 to go back to main menu:

            If %errorlevel% equ 1 goto ck3rong
            If %rmv% equ 1 (
                echo Creating batch file...
                (
                    echo @echo off
                    echo Performance Optimizer:
                    echo Scheduled Disk Checker
                    echo ^chkdsk C^:
                ) >%cdonly%
                copy %cdonly% "%cdoboot%"
                del %cdonly%
                if exist "%cdfboot%" del "%cdfboot%"
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :ck3rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto chk3
            ))
        
        :chk4
            cls
            echo --------------------------------------------------------------
            echo         This will create a bat file that will check 
            echo                    and fix disk at boot
            echo             ! Can be disabled after applying !
            echo             ! This will remove check at boot !
            echo --------------------------------------------------------------
            set /p rmv=Type 1 to apply, 0 to go back to main menu:

            If %errorlevel% equ 1 goto ck4rong
            If %rmv% equ 1 (
                echo Creating batch file...
                (
                    echo @echo off
                    echo Performance Optimizer:
                    echo Scheduled Disk Checker
                    echo ^chkdsk C^:
                ) >%cdf%
                copy %cdf% "%cdfboot%"
                del %cdf%
                if exist "%cdoboot%" del "%cdoboot%"
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :ck4rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto chk4
            ))

        :chk5
            cls
            echo --------------------------------------------------------------
            echo         This will remove the batch files that run 
            echo                      chkdsk at boot
            echo --------------------------------------------------------------
            set /p rmv=Type 1 to remove, 0 to go back to main menu:

            If %errorlevel% equ 1 goto ck5rong
            If %rmv% equ 1 (
                echo Deleting batch files...
                if exist "%cdoboot%" del "%cdoboot%"
                if exist "%cdfboot%" del "%cdfboot%"
                PING -n 3 127.0.0.1>nul
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :ck5rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto chk5
            ))

    :: DSKCHK End

    :: DNS Start

        :dnschk
            If exist %d1on% (
                set dnsname=%d1name%
                set don=%d1on%
            ) else ( 
            If exist %d2on% (
                set dnsname=%d2name%
                set don=%d2on%
            ) else ( 
            If exist %d3on% (
                set dnsname=%d3name%
                set don=%d3on%
            ) else ( 
                set dnsname=nul
                set don=nul
            )))
            goto dnschk2

        :dnschk2
            echo Checking if dns is already patched...
            if exist "%dnson%" goto dnstrue
            if not exist "%dnson%" goto dnsfalse
        
        :dnstrue
            cls
            echo ! DNS has been patched !
            echo --------------------------------------------------------------
            echo          Do you wish to modify or remove the patch?
            echo --------------------------------------------------------------
            echo Enabled DNS Server: %dnsname%
            echo --------------------------------------------------------------
            echo 1. Modify
            echo 2. Remove
            echo 0. Back to menu
            set /p dnsx=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto dstrong
            If %dnsx% equ 1 (
                goto dnsfalse
            ) else (
            If %dnsx% equ 2 (
                goto dnsremenu
            ) else (
            If %dnsx% equ 0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :dstrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto dnstrue
            )))

        :dnsremenu
            cls
            echo --------------------------------------------------------------
            echo               Do you wish to disable %dnsname%?
            echo --------------------------------------------------------------
            set /p dnsr=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto dsrrong
            If %dnsr% equ 1 (
                del "%dnson%"
                del "%don%"
                echo Removing DNS patch and restoring stock setting...
                goto dnsdisable
            ) else (
            If %dnsr% equ 0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( 
                :dsrrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto dnsremenu
            ))

            :dnsdisable
                :: Clean DNS Server
                wmic nicconfig where (IPEnabled=TRUE) call SetDNSServerSearchOrder ()
                ipconfig /flushdns
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
        
        :dnsfalse
            cls
            echo --------------------------------------------------------------
            echo                   Do you wish to patch DNS?
            echo         ! Only patch when the computer is connected !
            echo --------------------------------------------------------------
            set /p dnsr=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto dsfrong
            If %dnsr% equ 1 (
                echo Proceeding to DNS Patch menu...
                PING -n 3 127.0.0.1>nul
                goto dnsmenu
            ) else (
            If %dnsr% equ 0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( 
                :dsfrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto dnsfalse
            ))

        :dnsmenu   
            cls
            color f3
            echo --------------------------------------------------------------
            echo                      DNS Patch Menu
            echo --------------------------------------------------------------
            if not exist "%d1on%" echo 1. %d1name%
            if not exist "%d2on%" echo 2. %d2name%
            if not exist "%d3on%" echo 3. %d3name%
            if exist "%dnson%" echo 4. Disable %dnsname% Patch
            echo 0. Back to menu...
            echo --------------------------------------------------------------
            set /p dnsp=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto dnsrong
            If %dnsp% equ 1 (
                if exist "%d1on%" goto dnsrong
                set dns=%dns1%
                set dnss=%dns1s%
                set dnsapp=%d1name%
                set dnsn=dns.1
                goto dnsa
            ) else (
            If %dnsp% equ 2 (
                if exist "%d2on%" goto dnsrong
                set dns=%dns2%
                set dnss=%dns2s%
                set dnsapp=%d2name%
                set dnsn=dns.2
                goto dnsa
            ) else (
            If %dnsp% equ 3 (
                if exist "%d3on%" goto dnsrong
                set dns=%dns3%
                set dnss=%dns3s%
                set dnsapp=%d3name%
                set dnsn=dns.3
                goto dnsa
            ) else (
            If %dnsp% equ 4 (
                goto dnsremenu
            ) else (
            If %dnsp% equ 0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :dnsrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto dnsmenu
            )))))

            :dnsa
                echo Detecting if any dns is applied...
                if exist "%d1on%" (
                    echo Detected %d1name%! Resetting DNS patch...
                    del "%d1on%"
                    goto dnsa2
                ) else (
                if exist "%d2on%" (
                    echo Detected %d2name%! Resetting DNS patch...
                    del "%d2on%"
                    goto dnsa2
                ) else (
                if exist "%d3on%" (
                    echo Detected %d3name%! Resetting DNS patch...
                    del "%d3on%"
                    goto dnsa2
                ) else (
                    echo No patch detected proceeding to patch...
                    PING -n 3 127.0.0.1>nul
                    goto dnsa2
                )))

            :dnsa2    
                echo 1 >dns_on
                echo 1 >%dnsn%
                echo Applying %dnsapp% Patch...
                :: Clean DNS Servers
                wmic nicconfig where (IPEnabled=TRUE) call SetDNSServerSearchOrder ()
                :: Apply DNS Servers
                wmic nicconfig where (IPEnabled=TRUE) call SetDNSServerSearchOrder ("%dns%", "%dnss%")
                ipconfig /flushdns
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu


    :: DNS End

    :: REMBLT Start

        :bltchk
            echo Checking if bloatwares was previously removed...
            if exist "%POblt%" goto bltmenu
            if not exist "%POblt%" goto blt1

        :bltmenu
            cls
            echo ! Bloatwares had been previously removed !
            echo --------------------------------------------------------------
            echo               Do you want to remove them again?
            echo --------------------------------------------------------------
            set /p bltm=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto bltrong
            If %bltm% equ 1 (
                echo Proceeding to bloatware remover...
                del "%POblt%"
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ) else (
            If %bltm% equ 0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( 
                :bltrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto bltmenu
            ))

        :blt1   
            cls
            color f1
            echo --------------------------------------------------------------
            echo  Do you want to remove pre-installed bloatware applications?
            echo --------------------------------------------------------------
            set /p rmv=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto b1rong
            If %rmv% equ 1 (
                echo Proceeding to uninstall...
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( 
                :b1rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto blt1
            ))
        
        :rmv1
            cls
            echo --------------------------------------------------------------
            echo      Are you sure? This could take at least 10 minutes...
            echo  The program will go back to main menu after uninstalling all
            echo --------------------------------------------------------------
            set /p rmv=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto rrong
            If %rmv% equ 1 (
                goto rmx
            ) else (
            If %rmv% equ 0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( 
                :rrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ))

        :rmx
            echo Creating list of apps to be removed...
            :: List
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
            copy %bltlist% "%POblt%" >nul
            PING -n 3 127.0.0.1>nul

        :bltchoice
            cls
            echo !FINAL WARNING!
            set /p bltx=Are you sure to proceed? Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto bcrong
            If %bltx% equ 1 (
                goto bltwr1
            ) else (
            If %bltx% equ 0 (
                goto bltwr0
            ) else ( 
                :bcrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto bltchoice
            ))

        :bltwr0
            del "%POblt%"
            echo Cancelled... Going back to main menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

        :bltwr1
            :: Removing of bloatware start
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

            :: Removing of bloatware end
            echo Successful! Proceeding back to main menu...
            PING -n 3 127.0.0.1>nul
            goto MMenu

    :: REMBLT End

:: Modules End

:: End code
goto prg
