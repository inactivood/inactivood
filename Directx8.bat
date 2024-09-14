@echo off
REM Script to set DirectX 8 and fix black jerseys in IOSoccer - Discord: inactivoo

REM ruta hacia Steam y ios
set steamPath="C:\Program Files (x86)\Steam\steam.exe"
set gameID=673560

REM cambia DirectX a 8
set launchParams=-dxlevel 81
%steamPath% -applaunch %gameID% %launchParams%

REM espera a que el usuario cierre el juego
echo Waiting for the game to close...
pause

REM modifica kit.vmt para arreglar el problema de camisetas negras
set vmtFile="C:\Program Files (x86)\Steam\steamapps\common\IOSoccer\iosoccer\materials\models\player\default\kit.vmt"

REM cambia $detailblendmode de 2 a 1
echo Replacing $detailblendmode value in kit.vmt...
powershell -Command "(Get-Content %vmtFile%) -replace '\$detailblendmode 2', '\$detailblendmode 1' | Set-Content %vmtFile%"

echo Done! DirectX 8 set and black jersey fix applied.
pause