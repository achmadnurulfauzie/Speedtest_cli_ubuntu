@echo off
:: Batch script untuk mengunduh beberapa file

:: Daftar URL dan output file
set URL1=https://www.tiktok.com/tos-live-studio/releases/12265072/0.74.4/win32-x64/tiktok_live_studio-v0.74.4.exe
set OUTPUT1=tiktok_live_studio-v0.74.4.exe

set URL2=https://www.e2esoft.com/files/VCam_v6.4.exe
set OUTPUT2=VCam_v6.4.exe

set URL3=https://www.e2esoft.com/files/VSC_v2.2.exe
set OUTPUT3=VSC_v2.2.exe

:: Cek apakah curl tersedia
curl --version >nul 2>&1
if %errorlevel% neq 0 (
    echo curl tidak ditemukan. Pastikan curl tersedia di sistem Anda.
    pause
    exit /b
)

:: Fungsi untuk mengunduh file
call :download %URL1% %OUTPUT1%
call :download %URL2% %OUTPUT2%
call :download %URL3% %OUTPUT3%

echo Semua unduhan selesai.
pause
exit /b

:download
echo Mengunduh file dari %1...
curl -o %2 %1

:: Cek apakah unduhan berhasil
if exist %2 (
    echo Berhasil mengunduh: %2
) else (
    echo Gagal mengunduh: %2
)
goto :eof
