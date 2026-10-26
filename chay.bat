@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title Khoi dong ung dung Vite

echo ========================================
echo   KHOI DONG UNG DUNG
 echo ========================================
if not exist "package.json" (
  echo [LOI] Khong tim thay package.json.
  echo Hay dat chay.bat cung thu muc voi package.json.
  pause
  exit /b 1
)
where node >nul 2>&1
if errorlevel 1 (
  echo [LOI] Chua tim thay Node.js. Cai Node.js LTS roi thu lai.
  pause
  exit /b 1
)
where npm >nul 2>&1
if errorlevel 1 (
  echo [LOI] Khong tim thay npm.
  pause
  exit /b 1
)
if not exist "node_modules\vite\bin\vite.js" (
  echo [1/2] Dang cai thu vien...
  call npm install --legacy-peer-deps
  if errorlevel 1 (
    echo.
    echo [LOI] Khong cai duoc thu vien. Chup anh loi trong cua so nay.
    pause
    exit /b 1
  )
)
echo [2/2] Dang khoi dong Vite...
echo Neu thanh cong, nhan vao dia chi Local hien ben duoi.
echo Trinh duyet se tu mo khi Vite da khoi dong.
echo Khong dong cua so nay khi su dung ung dung.
call npm run dev -- --host 127.0.0.1 --open
if errorlevel 1 echo [LOI] Vite da dung voi ma loi %errorlevel%.
pause
