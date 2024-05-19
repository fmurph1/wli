bcdedit -set TESTSIGNING OFF
start %~dp0grub2win\G2WInstall.exe
echo Press any key after grub2win installation is complete.
pause
xcopy /i "%~dp0grub.cfg" "C:\grub2\grub.cfg" /Y
md C:\grub2\windata\customconfigs
"">C:\grub2\windata\customconfigs\BootAnISOfile.cfg
xcopy /i "%~dp0BootAnISOfile.cfg" "C:\grub2\windata\customconfigs\BootAnISOfile.cfg" /Y

powershell -Command "Start-BitsTransfer -Source "https://mirrors.layeronline.com/linuxmint/stable/21.3/linuxmint-21.3-cinnamon-64bit.iso" -Destination "C:\linuxmint-21.3-cinnamon-64bit.iso""

shutdown /r
