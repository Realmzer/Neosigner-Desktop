:: iPASideloader setup script
:: Installs all required dependencies for iPASideloader

@echo off
setlocal enabledelayedexpansion

echo iPASideloader Setup
echo =======================
echo This script will install the necessary dependencies for iPASideloader

for /f %%a in ('"prompt $E & for %%b in (1) do rem"') do set "ESC=%%a"
echo %ESC%[33mNote: You do not need to do this if you already have a supported Python version.%ESC%[0m
set /p USER_INPUT=Do you want to install the latest Python version? (y/n): 
if /i not "%USER_INPUT%"=="y" (
    echo Installation cancelled.
    pause
    goto main_depends
)

echo Fetching latest Python installer...

powershell -NoProfile -Command ^
    "$html = Invoke-WebRequest 'https://www.python.org/downloads/windows/';" ^
    "$matches = $html.Links | Where-Object { $_.href -match 'https://www\.python\.org/ftp/python/.+-amd64\.exe$' };" ^
    "Write-Output $matches[0].href" > "%TEMP%\python_url.txt"

set /p PYTHON_URL=<"%TEMP%\python_url.txt"
if "%PYTHON_URL%"=="" (
    echo Failed to retrieve the Python installer URL.
    pause
    exit /b 1
    goto main_depends
)

set "TMPFILE=%TEMP%\python_installer.exe"
echo Downloading from: %PYTHON_URL%
curl -L -o "%TMPFILE%" "%PYTHON_URL%"
if not exist "%TMPFILE%" (
    echo Download failed.
    pause
    goto main_depends
)

echo Launching Python installer...
echo ====================================================
for /f %%a in ('"prompt $E & for %%b in (1) do rem"') do set "ESC=%%a"
echo %ESC%[33mMake sure to enable "Add python.exe to PATH"%ESC%[0m
echo ====================================================
start /wait "" "%TMPFILE%"

:main_depends
set "ZSIGN_ZIP_URL=https://github.com/zhlynn/zsign/releases/download/v0.7/zsign-v0.7-windows-x64.zip"
set "ZSIGN_ZIP_FILE=zsign-v0.7-windows-x64.zip"
set "ZSIGN_EXTRACT_TO=zsign-windows"

echo Downloading zsign...
powershell -nologo -noprofile -command "Invoke-WebRequest -Uri '%ZSIGN_ZIP_URL%' -OutFile '%ZSIGN_ZIP_FILE%'"

if not exist "%ZSIGN_ZIP_FILE%" (
    echo Download failed or file not found.
    exit /b 1
)

if not exist "%ZSIGN_EXTRACT_TO%" mkdir "%ZSIGN_EXTRACT_TO%"

echo Extracting %ZSIGN_ZIP_FILE% to %ZSIGN_EXTRACT_TO%
powershell -nologo -noprofile -command "Expand-Archive -Path '%ZSIGN_ZIP_FILE%' -DestinationPath '%ZSIGN_EXTRACT_TO%' -Force"

del "%ZSIGN_ZIP_FILE%"
echo Done! 
echo Files extracted to %ZSIGN_EXTRACT_TO%.

set "LIBIMOBILEDEVICE_ZIP_URL=https://github.com/libimobiledevice-win32/imobiledevice-net/releases/download/v1.3.17/libimobiledevice.1.2.1-r1122-win-x64.zip"
set "LIBIMOBILEDEVICE_ZIP_FILE=libimobiledevice.1.2.1-r1122-win-x64.zip"
set "LIBIMOBILEDEVICE_EXTRACT_TO=libimobiledevice-windows"

echo Downloading libimobiledevice...
powershell -nologo -noprofile -command "Invoke-WebRequest -Uri '%LIBIMOBILEDEVICE_ZIP_URL%' -OutFile '%LIBIMOBILEDEVICE_ZIP_FILE%'"

if not exist "%LIBIMOBILEDEVICE_ZIP_FILE%" (
    echo Download failed or file not found.
    exit /b 1
)

if not exist "%LIBIMOBILEDEVICE_EXTRACT_TO%" mkdir "%LIBIMOBILEDEVICE_EXTRACT_TO%"

echo Extracting %LIBIMOBILEDEVICE_ZIP_FILE% to %LIBIMOBILEDEVICE_EXTRACT_TO%
powershell -nologo -noprofile -command "Expand-Archive -Path '%LIBIMOBILEDEVICE_ZIP_FILE%' -DestinationPath '%LIBIMOBILEDEVICE_EXTRACT_TO%' -Force"

del "%LIBIMOBILEDEVICE_ZIP_FILE%"
echo Done! 
echo Files extracted to %LIBIMOBILEDEVICE_EXTRACT_TO%.

echo Installing Python dependencies...
if exist requirements.txt (
    pip install -r requirements.txt
) else (
    pip install pyinstaller pillow
)

echo Setup complete. You can now run iPASideloader with: python zsign_gui.py