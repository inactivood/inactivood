@echo off
REM Script to set DirectX 9 and restore default jersey settings in IOSoccer - Discord: inactivoo

REM ruta hacia Steam y ios
set steamPath="C:\Program Files (x86)\Steam\steam.exe"
set gameID=673560

REM cambia DirectX a 9
set launchParams=-dxlevel 90
%steamPath% -applaunch %gameID% %launchParams%

REM espera a que el usuario cierre el juego
echo Waiting for the game to close...
pause

REM modifica kit.vmt para restaurar el valor de $detailblendmode
set vmtFile="C:\Program Files (x86)\Steam\steamapps\common\IOSoccer\iosoccer\materials\models\player\default\kit.vmt"

REM cambia $detailblendmode de 1 a 2
echo Replacing $detailblendmode value in kit.vmt...
powershell -Command "(Get-Content %vmtFile%) -replace '\$detailblendmode 1', '\$detailblendmode 2' | Set-Content %vmtFile%"

echo Done! DirectX 9 set and jersey settings restored.
pause
