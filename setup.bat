:: iPASideloader setup script
:: Installs all required dependencies for iPASideloader

echo "📱 iPASideloader Setup"
echo "======================="
echo "This script will install the necessary dependencies for iPASideloader"
echo

set "ZSIGN_ZIP_URL=https://github.com/zhlynn/zsign/releases/download/v0.7/zsign-v0.7-windows-x64.zip"
set "ZSIGN_ZIP_FILE=zsign-v0.7-windows-x64.zip"
set "ZSIGN_EXTRACT_TO=zsign-windows"

echo Downloading zsign ZIP file from %ZSIGN_ZIP_URL%...
powershell -nologo -noprofile -command "Invoke-WebRequest -Uri '%ZSIGN_ZIP_URL%' -OutFile '%ZSIGN_ZIP_FILE%'"

if not exist "%ZSIGN_ZIP_FILE%" (
    echo Download failed or file not found.
    exit /b 1
)

if not exist "%ZSIGN_EXTRACT_TO%" mkdir "%ZSIGN_EXTRACT_TO%"

echo Extracting %ZSIGN_ZIP_FILE% to %ZSIGN_EXTRACT_TO%...
powershell -nologo -noprofile -command "Expand-Archive -Path '%ZSIGN_ZIP_FILE%' -DestinationPath '%ZSIGN_EXTRACT_TO%' -Force"

del "%ZSIGN_ZIP_FILE%"
echo Done! Files extracted to %ZSIGN_EXTRACT_TO%.