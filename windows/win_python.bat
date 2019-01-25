@echo off

setlocal ENABLEDELAYEDEXPANSION
rem remove quotes from %2
set PN=%2
set PROJNAME=%PN:"=%
set PROJNAME
rem remove quotes from %3
set PD=%3
set PROJDIR=%PD:"=%

rd /S /Q "%PROJDIR%\..\staging"
mkdir "%PROJDIR%\..\staging"
xcopy "%PROJDIR%" "%PROJDIR%\..\staging\" /E /R /Y /EXCLUDE:copyignorelist.txt


@echo rm -rf "/home/root/Documents/KISS/Default User/%PROJNAME%" > win.cmd
@echo mkdir "/home/root/Documents/KISS/Default User/%PROJNAME%" >> win.cmd
@echo mkdir "/home/root/Documents/KISS/Default User/%PROJNAME%/bin" >> win.cmd
@echo mkdir "/home/root/Documents/KISS/Default User/%PROJNAME%/src" >> win.cmd
@echo mkdir "/home/root/Documents/KISS/Default User/%PROJNAME%/data" >> win.cmd
@echo mkdir "/home/root/Documents/KISS/Default User/%PROJNAME%/include" >> win.cmd
@echo echo '{"language":"Python","user":"Default User"}' > '/home/root/Documents/KISS/Default User/%PROJNAME%/project.manifest' >> win.cmd

echo Uploading program to %1...
putty.exe -ssh root@%1 -m win.cmd

set ESCAPED2=%PROJNAME: =\ %

pscp.exe -scp -r "%PROJDIR%\..\staging\*" "root@%1:/home/root/Documents/KISS/Default\ User/%ESCAPED2%/bin/"

plink root@%1 "ln -s '/home/root/Documents/KISS/Default User/%PROJNAME%/bin/main.py' '/home/root/Documents/KISS/Default User/%PROJNAME%/bin/botball_user_program'; tr -d '\015' < '/home/root/Documents/KISS/Default User/%PROJNAME%/bin/botball_user_program' > '/tmp/tmp_botball_user_program'; cat '/tmp/tmp_botball_user_program' > '/home/root/Documents/KISS/Default User/%PROJNAME%/bin/botball_user_program'; chmod +x '/home/root/Documents/KISS/Default User/%PROJNAME%/bin/main.py'"

rd /S /Q "%PROJDIR%\..\staging"
echo Upload complete!
