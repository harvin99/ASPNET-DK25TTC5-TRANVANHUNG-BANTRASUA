@echo off
title WEB TRA SUA - Dang cai dat...
color 0A

set "ROOT=%~dp0"
set "SITE=%ROOT%src\WebTraSua"
set "SLN=%ROOT%src\WebTraSua.sln"
set "NUGET=%TEMP%\nuget.exe"
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
set "IISEXPRESS=%ProgramFiles%\IIS Express\iisexpress.exe"
if not exist "%IISEXPRESS%" set "IISEXPRESS=%ProgramFiles(x86)%\IIS Express\iisexpress.exe"

echo =====================================
echo  WEBSITE BAN TRA SUA - Cai dat
echo =====================================
echo.

echo [1/4] Dang tao database QuanLiTraSua...
sqlcmd -S .\SQLEXPRESS -E -i "%ROOT%QuanLiTraSua.sql"
if errorlevel 1 (
    echo.
    echo [!] Khong tao duoc database bang sqlcmd.
    echo     Hay mo file QuanLiTraSua.sql bang SSMS va nhan F5 (Execute^).
    echo     Roi quay lai chay tiep file nay.
    echo.
)

echo.
echo [2/4] Dang khoi phuc goi NuGet...
rem Du an dung packages.config kieu cu, msbuild /t:Restore khong ho tro,
rem bat buoc phai chay nuget.exe restore thi build moi qua.
if not exist "%NUGET%" (
    echo     Dang tai nuget.exe...
    powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol='Tls12'; Invoke-WebRequest -Uri 'https://dist.nuget.org/win-x86-commandline/latest/nuget.exe' -OutFile '%NUGET%'"
)
if not exist "%NUGET%" (
    echo [!] Khong tai duoc nuget.exe - kiem tra ket noi mang.
    goto :error
)
"%NUGET%" restore "%SLN%"
if errorlevel 1 goto :error

echo.
echo [3/4] Dang build du an...
for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do set "MSBUILD=%%i"
if not defined MSBUILD (
    echo [!] Khong tim thay MSBuild - chua cai Visual Studio?
    goto :error
)
"%MSBUILD%" "%SLN%" /t:Build /p:Configuration=Debug /v:minimal
if errorlevel 1 goto :error

echo.
echo [4/4] Khoi dong website...
if not exist "%IISEXPRESS%" (
    echo [!] Khong tim thay IIS Express.
    echo     Cai kem Visual Studio hoac tai rieng tu trang Microsoft.
    goto :error
)

echo.
echo =====================================
echo  Truy cap: http://localhost:64335
echo  Admin: admin / admin123
echo  Khach hang: khachhang / 123456
echo =====================================
echo.

start "IIS Express - Web Tra Sua" "%IISEXPRESS%" /path:"%SITE%" /port:64335
rem Cho server len roi moi mo trinh duyet, tranh loi "khong ket noi duoc" o lan dau
timeout /t 4 /nobreak >nul
start "" http://localhost:64335
echo  Dong cua so "IIS Express - Web Tra Sua" de tat server.
goto :end

:error
echo.
echo [!] Da xay ra loi! Vui long kiem tra:
echo     - Da cai Visual Studio 2019+ kem .NET Framework 4.8 targeting pack chua?
echo     - SQL Server (SQLEXPRESS^) co dang chay khong?
echo     - May co ket noi mang de tai goi NuGet khong?
pause
exit /b 1

:end
pause
