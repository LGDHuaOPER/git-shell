@echo off
chcp 65001

@REM 获取管理员权限 start

@REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
@REM if '%errorlevel%' NEQ '0' (
@REM goto UACPrompt
@REM ) else ( goto gotAdmin )
@REM :UACPrompt
@REM echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
@REM echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
@REM "%temp%\getadmin.vbs"
@REM exit /B
@REM :gotAdmin
@REM if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

@REM 获取管理员权限 end

echo "当前驱动器和路径="
%~dp0
echo.

echo "cd /D %~dp0"
cd /D %~dp0
echo.

echo "dir"
dir
echo.

bash code_.sh %~n0

pause
