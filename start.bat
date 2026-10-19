@echo off
chcp 65001 >nul
title Local Judge (Go)
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js not found. Install it from https://nodejs.org/
  pause
  exit /b 1
)

where go >nul 2>nul
if errorlevel 1 (
  echo [WARN] Go not found. Install it from https://go.dev/dl/
  echo        If you just installed it, close this window and run start.bat again.
  echo.
)

rem Open the browser 1 second later (after the server is up)
start "" /min cmd /c "timeout /t 1 /nobreak >nul & start "" http://localhost:2437"

echo Press Ctrl+C or close this window to stop the server.
echo.
node backend\server.js

echo.
echo Server stopped.
pause
