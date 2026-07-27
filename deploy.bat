@echo off
REM ============================================================
REM VanPlanner 3D - Deploiement automatique Cloudflare Pages
REM Version Windows
REM ============================================================

setlocal
set PROJECT_NAME=vanplanner-3d

echo.
echo VanPlanner 3D - Deploiement Cloudflare Pages
echo ================================================
echo.

REM 1. Verifier Node.js
where node >nul 2>nul
if errorlevel 1 (
  echo ERREUR : Node.js n'est pas installe. Telecharge-le sur https://nodejs.org
  pause
  exit /b 1
)

REM 2. Installer les dependances si necessaire
if not exist "node_modules" (
  echo Installation des dependances...
  call npm install
)

REM 3. Build de production
echo Build de production...
call npm run build

REM 4. Deployer via wrangler
echo.
echo Deploiement sur Cloudflare Pages...
echo.
echo IMPORTANT : Au premier lancement, une fenetre navigateur va s'ouvrir
echo             pour t'authentifier sur ton compte Cloudflare.
echo.

call npx --yes wrangler@latest pages deploy dist --project-name=%PROJECT_NAME% --commit-dirty=true

echo.
echo Deploiement termine !
echo Ton app est en ligne sur : https://%PROJECT_NAME%.pages.dev
echo.
pause
