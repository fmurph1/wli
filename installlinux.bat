bcdedit -set TESTSIGNING OFF
start %~dp0grub2win\G2WInstall.exe
echo Press any key after grub2win installation is complete.
pause
xcopy /s /i "%~dp0grub2" "C:\grub2" /Y
xcopy /s /i "%~dp0linuxmint-21.2-cinnamon-64bit.iso" "C:\" /Y
shutdown /r