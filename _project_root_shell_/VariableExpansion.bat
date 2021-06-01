@echo off
chcp 65001

@REM 选项语法:

@REM ~0 - 删除任何引号(")，扩充 %0

@REM %~f0 - 将 %0 扩充到一个完全合格的路径名(“f”是file，即文件)

@REM %~d0 - 仅将 %0 扩充到一个驱动器号

@REM %~p0 - 仅将 %0 扩充到一个路径

@REM %~n0 - 仅将 %0 扩充到一个文件名(“n”是name 文件名)

@REM %~x0 - 仅将 %0 扩充到一个文件扩展名

@REM %~s0 - 扩充的路径只含有短名(“s”为Short，短的)

@REM %~a0 - 将 %0 扩充到文件的文件属性(“a”为attribute，即属性)

@REM %~t0 - 将 %0 扩充到文件的日期/时间(“t”time)

@REM %~z0 - 将 %0 扩充到文件的大小(Size 大小)

@REM %~$PATH:0 - 查找列在路径环境变量的目录，并将 %0 扩充 到找到的第一个完全合格的名称。如果环境变量名 未被定义，或者没有找到文件，此组合键会扩充到 空字符串

@REM 可以组合修饰符来得到多重结果:

@REM %~dp0 - 仅将 %0 扩充到一个驱动器号和路径

@REM %~nx0 - 仅将 %0 扩充到一个文件名和扩展名

@REM %~fs0 - 仅将 %0 扩充到一个带有短名的完整路径名

@REM %~dp$PATH:0 - 查找列在路径环境变量的目录，并将 %I 扩充 到找到的第一个驱动器号和路径。

@REM %~ftza0 - 将 %0 扩充到类似输出线路的

@REM DIR%0为当前批处理文件

@REM 如果0换成1为第一个文件，2为第2个

if not "%OS%"=="Windows_NT" exit
title WindosActive

echo.
echo 将 ^%%I 扩充到一个完全合格的路径名
echo %~f0
echo.
echo 仅将 ^%%I 扩充到一个驱动器号 
echo %~d0
echo.
echo 仅将 ^%%I 扩充到一个路径 
echo %~p0
echo.
echo 仅将 ^%%I 扩充到一个驱动器和路径 
echo %~dp0
echo.
echo 仅将 ^%%I 扩充到一个文件名 
echo %~n0
echo.
echo 仅将 ^%%I 扩充到一个文件扩展名 
echo %~x0
echo.
echo 扩充的路径只含有短名 
echo %~s0
echo.
echo 将 ^%%I 扩充到文件的文件属性 
echo %~a0
echo.
echo 将 ^%%I 扩充到文件的日期/时间 
echo %~t0
echo.
echo 将 ^%%I 扩充到文件的大小 
echo %~z0
echo.
echo 查找列在路径环境变量的目录，并将 ^%%I 扩充到找到的第一个完全合格的名称。如果环境变量名 未被定义，或者没有找到文件，此组合键会扩充到 空字符串 
echo %~$PATH:0
echo.
echo 组合扩展:
echo 驱动器+路径+文件名 +文件扩展名 +文件属性 +日期/时间 +文件的大小 
echo %~dpnxatz0
echo.
echo 驱动器+路径+文件名 +文件扩展名 +文件属性 +日期/时间 +文件的大小+ 短名 
echo %~dpnxatzs0
echo.

pause
