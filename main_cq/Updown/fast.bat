@echo off
setlocal enabledelayedexpansion
set "downloadsFolder=..\downloads"
set "sevenZipFolder=7-Zip"
set "sevenZipPath=%~dp0%sevenZipFolder%\7z.exe"

cd /d "%downloadsFolder%"
REM �������е�7z�ļ�����ѹ
for %%i in (*.7z) do (
    echo ���ڽ�ѹ: "%%i"
    "%sevenZipPath%" x "%%i" -y -aoa -o"..\"
)
timeout /t 1 /nobreak >nul
set Program=%cd%\..\cq.exe
set LnkName=��ǩ
set WorkDir=%cd%\..
set Desc=������YX
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.IconLocation="%cd%\..\UI\icon.ico"
echo oShellLink.Save)>makelnk.vbs
echo �����ݷ�ʽ�����ɹ��� 
makelnk.vbs
del /f /q makelnk.vbs
exit
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof
pause
