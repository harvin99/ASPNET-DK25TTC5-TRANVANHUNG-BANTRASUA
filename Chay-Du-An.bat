@echo off
title WEB TRA SUA - Dang khoi dong...
color 0A

set "SITE=%~dp0src\WebTraSua"
set "IISEXPRESS=%ProgramFiles%\IIS Express\iisexpress.exe"
if not exist "%IISEXPRESS%" set "IISEXPRESS=%ProgramFiles(x86)%\IIS Express\iisexpress.exe"

echo =====================================
echo  WEBSITE BAN TRA SUA - Khoi dong
echo =====================================
echo.

if not exist "%IISEXPRESS%" (
    echo [!] Khong tim thay IIS Express.
    echo     Hay chay file Chay-Day-Du-Chu.bat truoc.
    pause
    exit /b 1
)

if not exist "%SITE%\bin\WebTraSua.dll" (
    echo [!] Du an chua duoc build.
    echo     Hay chay file Chay-Day-Du-Chu.bat truoc.
    pause
    exit /b 1
)

echo  Truy cap: http://localhost:64335
echo  Admin: admin / admin123
echo  Khach hang: khachhang / 123456
echo.

start "IIS Express - Web Tra Sua" "%IISEXPRESS%" /path:"%SITE%" /port:64335
rem Cho server len roi moi mo trinh duyet, tranh loi "khong ket noi duoc" o lan dau
timeout /t 4 /nobreak >nul
start "" http://localhost:64335

echo  Dong cua so "IIS Express - Web Tra Sua" de tat server.
pause
