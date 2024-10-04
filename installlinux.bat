bcdedit -set TESTSIGNING OFF
start %~dp0grub2win\G2WInstall.exe
echo Press any key after grub2win installation is complete.
pause
xcopy /i "%~dp0grub.cfg" "C:\grub2\grub.cfg" /Y
md C:\grub2\windata\customconfigs
"">C:\grub2\windata\customconfigs\BootAnISOfile.cfg

ECHO OFF

ECHO ...............................................
ECHO Select your OS
ECHO ...............................................
ECHO 1 - Linux Mint 22 Cinnamon
ECHO 2 - Linux Mint 22 XFCE
ECHO 3 - Ubuntu 24.04.1 LTS

SET /P M=Type a number then press ENTER:
IF %M%==1 GOTO CIN
IF %M%==2 GOTO XFCE
IF %M%==3 GOTO UBU

:CIN
xcopy /i "%~dp0BootAnISOfile-cin.cfg" "C:\grub2\windata\customconfigs\BootAnISOfile.cfg" /Y
powershell -Command "Start-BitsTransfer -Source "https://mirrors.layeronline.com/linuxmint/stable/22/linuxmint-22-cinnamon-64bit.iso" -Destination "C:\linuxmint-22-cinnamon-64bit.iso""
GOTO SHUTDOWN

:XFCE
xcopy /i "%~dp0BootAnISOfile-xfce.cfg" "C:\grub2\windata\customconfigs\BootAnISOfile.cfg" /Y
powershell -Command "Start-BitsTransfer -Source "https://mirrors.layeronline.com/linuxmint/stable/22/linuxmint-22-xfce-64bit.iso" -Destination "C:\linuxmint-22-xfce-64bit.iso""
GOTO SHUTDOWN

:UBU
xcopy /i "%~dp0BootAnISOfile-ubu.cfg" "C:\grub2\windata\customconfigs\BootAnISOfile.cfg" /Y
powershell -Command "Start-BitsTransfer -Source "https://mirrors.edge.kernel.org/ubuntu-releases/24.04.1/ubuntu-24.04.1-desktop-amd64.iso" -Destination "C:\ubuntu-24.04.1-desktop-amd64.iso""

:SHUTDOWN
shutdown /r