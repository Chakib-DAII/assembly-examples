@echo off

@REM this script is used to generate executable from asm code
@REM created by Chakib DAII

if "%1"=="" goto err
if "%2"=="" goto err
if "%3"=="" goto err

echo generating executable from %1/%2 in %3 architecture

if "%3"=="32" (
        call nasm -f win32 %1/%2.asm -o %1/object-files/%2.o
    ) else ( call nasm -f win64 %1/%2.asm -o %1/object-files/%2.o )

ld %1/object-files/%2.o -o %1/executables/%2.exe

goto :end

:err
echo Usage: assemble-code.bat SOURCE-DIRECTORY SOURCE ARCHITECTURE
echo SOURCE-DIRECTORY (source file directory)
echo SOURCE (source file without extension)
echo ARCHITECTURE (32 or 64)

:end