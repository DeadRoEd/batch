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
set ver=r7.3

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
        set fbat1=%fdir%\fclean1.bat
        set fbat2=%fdir%\fclean2.bat
        set fbat3=%fdir%\fclean3.bat
        set fbatx1=%strtup%\fclean1.bat
        set fbatx2=%strtup%\fclean2.bat
        set fbatx3=%strtup%\fclean3.bat
    :: FCLEAN check
        set c1=%fdir%\c.1
        set c2=%fdir%\c.2
        set c3=%fdir%\c.3

    :: REGEDIT
        set regon=%regdir%\reg_on
        set rp1=%regdir%\rp.1
        set rp2=%regdir%\rp.2
        set rp3=%regdir%\rp.3
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

    :: DSKCHK
        set cdonly=chkonly.bat
        set cdoboot=%strtup%\%cdonly%
        set cdf=chkf.bat
        set cdfboot=%strtup%\%cdf%

    :: DNS
        set dnson=%dnsdir%\dns_on
        set dns1=
        set d1name=Google DNS
        set dns1s=
        set d1on=%dnsdir%\dns.1
        set dns2=
        set d2name=Open DNS
        set dns2s=
        set d2on=%dnsdir%\dns.2
        set dns3=
        set d3name=Something DNS
        set dns3s=
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
        echo                            %ver%
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
        echo         !Do not press enter without putting a value!
        echo    !Do not close the window using the one on the top right!
        echo --------------------------------------------------------------
        set /p mm=Please enter the number of choice then press ENTER: 
        
        If %errorlevel% equ 1 goto menurong
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
        ) else ( 
            :menurong
            echo Unknown value input! Please retry
            PING -n 3 127.0.0.1>nul
            goto MMenu 
        )))))))
    
    :fccheckm
        if exist "%c1%" (
            echo %m1% %on%
            goto rchk
        ) else (
        if exist "%c2%" (
            echo %m1% %on%
            goto rchk
        ) else (
        if exist "%c3%" (
            echo %m1% %on%
            goto rchk
        ) else ( 
            echo %m1% %off%
            goto rchk
        )))
    
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
            echo %m3% %off%
            goto dchk
        )))

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
        If %close%==1 (
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
        If %close%==0 (
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
            ) else ( 
                goto fc1
            )))
        
        :fcexist
            cls
            echo 1 >fc_on
            color f2    
            echo --------------------------------------------------------------
            echo                     File Cleaner Disabler
            echo --------------------------------------------------------------
            if exist "%c1%" echo 1. Disable 1st preset
            if exist "%c2%" echo 2. Disable 2nd preset
            if exist "%c3%" echo 3. Disable 3rd preset
            echo 4. Enable cleaners
            echo 0. Go back to main menu
            echo --------------------------------------------------------------
            set /p ecln=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto ecrong
            If %ecln%==1 (
                echo Disabling 1st cleaner...
                if not exist "%c1%" goto ecrong
                PING -n 3 127.0.0.1>nul
                goto fd1
            ) else (
            If %ecln%==2 (
                echo Disabling 2nd cleaner...
                if not exist "%c2%" goto ecrong
                PING -n 3 127.0.0.1>nul
                goto fd2
            ) else (
            If %ecln%==3 (
                echo Disabling 3rd cleaner...
                if not exist "%c3%" goto ecrong
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
            ) else ( 
                :ecrong
                echo Unknown value input! Please retry
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
            echo --------------------------------------------------------------
            echo                    What cleaner to enable?
            echo       ! The cleaners will clean your files at startup !
            echo ! The cleaners will save your settings even after disabling !
            echo --------------------------------------------------------------
            if not exist "%c1%" echo 1. Cleaner Preset 1
            if not exist "%c2%" echo 2. Cleaner Preset 2
            if not exist "%c3%" echo 3. Cleaner Preset 3
            echo 4. Disable cleaners
            echo 0. Go back to main menu
            echo --------------------------------------------------------------
            set /p cln=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto crong
            If %cln%==1 (
                if exist "%c1%" goto crong
                echo Enabling 1st cleaner...
                if not exist "%fcon%" echo 1 >fc_on
                PING -n 3 127.0.0.1>nul
                goto fcln1
            ) else (
            If %cln%==2 (
                if exist "%c2%" goto crong
                echo Enabling 2nd cleaner...
                if not exist "%fcon%" echo 1 >fc_on
                PING -n 3 127.0.0.1>nul
                goto fcln2
            ) else (
            If %cln%==3 (
                if exist "%c3%" goto crong
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
            ) else ( 
                :crong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto fc1
            )))))

            :fcln1
                echo 1 >c.1
                set sgset=sageset:91
                set sgrun=sagerun:91
                set fname=fclean1.bat
                set fbat=%fdir%\fclean1.bat
                goto fclnx

            :fcln2
                echo 1 >c.2
                set sgset=sageset:92
                set sgrun=sagerun:92
                set fname=fclean2.bat
                set fbat=%fdir%\fclean2.bat
                goto fclnx

            :fcln3
                echo 1 >c.3
                set sgset=sageset:93
                set sgrun=sagerun:93
                set fname=fclean3.bat
                set fbat=%fdir%\fclean3.bat
                goto fclnx

            :fclnx
                cleanmgr /%sgset%
                ( 
                    echo @echo off
                    echo ^cleanmgr /%sgrun%
                ) >%fname%
                copy /y "%fbat%" "%strtup%"
                
                echo --------------------------------------------------------------
                echo Do you want to run it now?
                echo --------------------------------------------------------------
                set /p sgx=Type 1 if yes, 0 if no:

                If %errorlevel% equ 1 goto fxrong
                If %sgx%==1 (
                    cleanmgr /%sgrun%
                    goto fclna
                ) else (
                If %sgx%==0 (
                    goto fclna
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
            if exist "%rt1%" echo RamOps scheduled every 1 hour
            if exist "%rt2%" echo RamOps scheduled every 3 hours
            if exist "%rt3%" echo RamOps scheduled every 5 hours
            echo --------------------------------------------------------------

            echo --------------------------------------------------------------
            echo        Do you want to change or disable RAM Optimizer?
            echo --------------------------------------------------------------
            set /p ram=Type 1 to Change, 2 to Disable, 0 to Cancel:
            
            If %errorlevel% equ 1 goto raong
            If %ram%==1 (
                schtasks /delete /tn "RAM Optimizer" /f
                del /f /q *
                goto rclean
            ) else (
            If %ram%==2 (
                schtasks /delete /tn "RAM Optimizer" /f
                del /f /q *
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %ram%==0 (
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
            If %ram%==1 (
                goto rclean
            ) else (
            If %ram%==0 (
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
            echo 1. 1 Hour
            echo 2. 3 Hours
            echo 3. 5 Hours
            echo 0. Go back to previous selection...
            echo --------------------------------------------------------------
            set /p rtx=
            
            If %errorlevel% equ 1 goto rtrong
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
            ) else ( 
                :rtrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto rtime
            ))))

        :rexecute
            echo FreeMem=Space(%rm%) >rboost.vbs
            schtasks /create /tn "RAM Optimizer" /tr "%rvbs%" /mo %rtm% /sc hourly 
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
                goto reg1
            )))

        :regexist
            cls
            echo 1 >reg_on
            color f3
            echo --------------------------------------------------------------
            echo      Do you want to restore or modify the registry edits?
            echo --------------------------------------------------------------
            echo 1. Restore
            echo 2. Modify
            echo 0. Go back to menu
            echo --------------------------------------------------------------
            set /p resreg=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto rgrong
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
            if exist "%regon%" echo 4. Restore All
            echo 0. Back to menu...
            echo --------------------------------------------------------------
            set /p resrm=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto resong
            If %resrm%==1 (
                set rall=0
                if not exist "%rp1%" goto resong
                goto resrm1
            ) else (
            If %resrm%==2 (
                set rall=0
                if not exist "%rp2%" goto resong
                goto resrm2
            ) else (
            If %resrm%==3 (
                set rall=0
                if not exist "%rp3%" goto resong
                goto resrm3
            ) else (
            If %resrm%==4 (
                set rall=1
                if exist "%rp1%" goto rconfirm
                if exist "%rp2%" goto rconfirm
                if exist "%rp3%" goto rconfirm
                goto resong
            ) else (
            If %resrm%==0 (
                echo Going back to menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :resong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regresmenu
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
                    goto MMenu
                ))

        :reg1
            cls
            color f4
            echo --------------------------------------------------------------
            echo             Do you want to apply Registry Patches?
            echo --------------------------------------------------------------
            set /p rgp=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto rg1rong
            If %rgp%==1 (
                goto regmenu
            ) else (
            If %rgp%==0 (
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
            if not exist "%regon%" echo 4. Patch all
            echo 0. Go back to main menu
            echo --------------------------------------------------------------
            echo                 !NOTE: Reboot after applying!
            echo --------------------------------------------------------------
            set /p rmm=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto rong
            If %rmm%==1 (
                set rmall=0
                if exist "%rp1%" goto rong
                goto regp1
            ) else (
            If %rmm%==2 (
                set rmall=0
                if exist "%rp2%" goto rong
                goto regp2
            ) else (
            If %rmm%==3 (
                set rmall=0
                if exist "%rp3%" goto rong
                goto regp3
            ) else (
            If %rmm%==4 (
                set rmall=1
                goto regp1y
            ) else (
            If %rmm%==0 (
                echo Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else ( 
                :rong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regmenu
            )))))

        :regp1 
            cls
            echo --------------------------------------------------------------
            echo         Do you want to disable all start-up programs?
            echo --------------------------------------------------------------
            set /p rp1=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto strtong
            If %rp1%==1 (
                :regp1y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.1
                :: Backup
                reg save "%lmr%" "%rd1%" /y
                reg save "%lmo%" "%rd2%" /y
                reg save "%cur%" "%rd3%" /y
                reg save "%cuo%" "%rd4%" /y
                :: Deletion
                reg delete "%lmr%" /f /va
                reg delete "%lmo%" /f /va
                reg delete "%cur%" /f /va
                reg delete "%cuo%" /f /va
                echo Successful! Going back to menu...
                PING -n 3 127.0.0.1>nul 
                if %rmall%==1 (
                    goto regp2y
                ) else ( 
                    goto MMenu
                )
            ) else (
            If %rp1%==0 (
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
            echo    !This will put stricter restrictions to applications!
            echo              !and remove visual animations!
            echo --------------------------------------------------------------
            set /p rp2=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto dskrong
            If %rp2%==1 (
                :regp2y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.2
                :: Backup
                reg save "%dt%" "%ra1%" /y
                :: Addition
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
            If %rp3%==1 (
                :regp3y
                if not exist "%regon%" echo 1 >reg_on
                echo 1 >rp.3
                :: Backup
                reg save "%ex%" "%re1%" /y
                :: Addition
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
            ) else ( 
                :fexong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto regp3
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
            If %chkx%==1 (
                goto chk1
            ) else (
            If %chkx%==2 (
                goto chk2
            ) else (
            If %chkx%==3 (
                if exist "%cdoboot%" goto chrong
                goto chk3
            ) else (
            If %chkx%==4 (
                if exist "%cdfboot%" goto chrong
                goto chk4
            ) else (
            If %chkx%==5 (
                if exist "%cdoboot%" goto chk5
                if exist "%cdfboot%" goto chk5
                goto chrong
            ) else (
            If %chkx%==0 (
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
            If %rmv%==1 (
                echo Checking C: disk...
                chkdsk C:
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv%==0 (
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
            If %rmv%==1 (
                echo Checking and fixing C: disk...
                chkdsk C: /f
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv%==0 (
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
            If %rmv%==1 (
                echo Creating batch file...
                (
                    echo @echo off
                    echo ^chkdsk C^:
                ) >%cdonly%
                copy %cdonly% "%cdoboot%"
                del %cdonly%
                if exist "%cdfboot%" del "%cdfboot%"
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv%==0 (
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
            If %rmv%==1 (
                echo Creating batch file...
                (
                    echo @echo off
                    echo ^chkdsk C^: /f
                ) >%cdf%
                copy %cdf% "%cdfboot%"
                del %cdf%
                if exist "%cdoboot%" del "%cdoboot%"
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv%==0 (
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
            If %rmv%==1 (
                echo Deleting batch files...
                if exist "%cdoboot%" del "%cdoboot%"
                if exist "%cdfboot%" del "%cdfboot%"
                PING -n 3 127.0.0.1>nul
                echo Done! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %rmv%==0 (
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
                set don=%d1on%
            ) else ( 
            If exist %d3on% (
                set dnsname=%d3name%
                set don=%d1on%
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
            echo 1. Modify
            echo 2. Remove
            echo 0. Back to menu
            set /p dnsx=Please enter the number of choice then press ENTER: 

            If %errorlevel% equ 1 goto dstrong
            If %dnsx%==1 (
                goto dnsmenu
            ) else (
            If %dnsx%==2 (
                goto dnsremenu
            ) else (
            If %dnsx%==0 (
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
            If %dnsr%==1 (
                del "%dnson%"
                del "%don%"
                echo Removing DNS patch and restoring stock setting...
                echo Successful! Going back to main menu...
                PING -n 3 127.0.0.1>nul
                goto MMenu
            ) else (
            If %dnsr%==0 (
                echo Going back to main menu...
                goto MMenu
            ) else ( 
                :dsrrong
                echo Unknown value input! Please retry
                PING -n 3 127.0.0.1>nul
                goto dnsremenu
            ))
        
        :dnsfalse
            cls
            echo --------------------------------------------------------------
            echo                   Do you wish to patch DNS?
            echo --------------------------------------------------------------
            set /p dnsr=Type 1 if yes, 0 if no:

            If %errorlevel% equ 1 goto dsfrong
            If %dnsr%==1 (
                echo Proceeding to DNS Patch menu...
                PING -n 3 127.0.0.1>nul
                goto dnsmenu
            ) else (
            If %dnsr%==0 (
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
            If %dnsp%==1 (
                if exist "%d1on%" goto dnsrong
                set dns=%dns1%
                set dnss=%dns1s%
                set dnsapp=%d1name%
                set dnsn=dns.1
                goto dnsa
            ) else (
            If %dnsp%==2 (
                if exist "%d2on%" goto dnsrong
                set dns=%dns2%
                set dnss=%dns2s%
                set dnsapp=%d2name%
                set dnsn=dns.2
                goto dnsa
            ) else (
            If %dnsp%==3 (
                if exist "%d3on%" goto dnsrong
                set dns=%dns3%
                set dnss=%dns3s%
                set dnsapp=%d3name%
                set dnsn=dns.3
                goto dnsa
            ) else (
            If %dnsp%==4 (
                goto dnsremenu
            ) else (
            If %dnsp%==0 (
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
            If %bltm%==1 (
                echo Proceeding to bloatware remover...
                del "%POblt%"
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ) else (
            If %bltm%==0 (
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
            If %rmv%==1 (
                echo Proceeding to uninstall...
                PING -n 3 127.0.0.1>nul
                goto rmv1
            ) else (
            If %rmv%==0 (
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
            If %rmv%==1 (
                goto rmx
            ) else (
            If %rmv%==0 (
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
            If %bltx%==1 (
                goto bltwr1
            ) else (
            If %bltx%==0 (
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
