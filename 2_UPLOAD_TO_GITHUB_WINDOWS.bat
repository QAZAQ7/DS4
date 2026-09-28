@echo off
setlocal
cd /d "%~dp0"
echo ==============================================
echo Friends Included - Upload to GitHub
echo ==============================================
set /p REPO=Paste GitHub repository URL: 
if "%REPO%"=="" exit /b 1
where git >nul 2>nul
if errorlevel 1 (
  echo Install Git for Windows from https://git-scm.com/download/win
  pause
  exit /b 1
)
if not exist ".git" git init
git branch -M main
git add .
git commit -m "Final Friends Included Day 4 submission"
git remote get-url origin >nul 2>nul
if errorlevel 1 (git remote add origin "%REPO%") else (git remote set-url origin "%REPO%")
git push -u origin main --force
if errorlevel 1 (
  echo Push failed. Sign in to GitHub and retry.
  pause
  exit /b 1
)
echo UPLOAD COMPLETE
pause
