@echo off
title Configuración de Turbo Boost del CPU
color 0E
setlocal ENABLEDELAYEDEXPANSION

:: ===== Elevación de privilegios =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo -------------------------------------
    echo Este script requiere permisos de administrador.
    echo -------------------------------------
    pause
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
echo ^| .--------------. ^|^| .--------------. ^|^| .--------------. ^|^| .--------------. ^|^| .--------------. ^|^| .--------------. ^|^| .--------------. ^|
echo ^| ^|  _________   ^| ^|^| ^|    ______    ^| ^|^| ^|   _____      ^| ^|^| ^|     _____    ^| ^|^| ^|   ______     ^| ^|^| ^|    ______    ^| ^|^| ^|  ____  ____  ^| ^|
echo ^| ^| ^|_   ___  ^|  ^| ^|^| ^|   / ____ `.  ^| ^|^| ^|  ^|_   _^|     ^| ^|^| ^|    ^|_   _^|   ^| ^|^| ^|  ^|_   __ \   ^| ^|^| ^|   / ____ `.  ^| ^|^| ^| ^|_  _^|^|_  _^| ^| ^|
echo ^| ^|   ^| ^|_  \_^|  ^| ^|^| ^|   `'  __^| ^|  ^| ^|^| ^|    ^| ^|       ^| ^|^| ^|      ^| ^|     ^| ^|^| ^|    ^| ^|__^| ^|  ^| ^|^| ^|   `'  __^| ^|  ^| ^|^| ^|   \ \  / /   ^| ^|
echo ^| ^|   ^|  _^|      ^| ^|^| ^|   _  ^|__ '.  ^| ^|^| ^|    ^| ^|   _   ^| ^|^| ^|      ^| ^|     ^| ^|^| ^|    ^|  ___/   ^| ^|^| ^|   _  ^|__ '.  ^| ^|^| ^|    ^> `' ^<    ^| ^|
echo ^| ^|  _^| ^|_       ^| ^|^| ^|  ^| \____^| ^|  ^| ^|^| ^|   _^| ^|__/ ^|  ^| ^|^| ^|     _^| ^|_    ^| ^|^| ^|   _^| ^|_      ^| ^|^| ^|  ^| \____^| ^|  ^| ^|^| ^|  _/ /'`\ \_  ^| ^|
echo ^| ^| ^|_____^|      ^| ^|^| ^|   \______.'  ^| ^|^| ^|  ^|________^|  ^| ^|^| ^|    ^|_____^|   ^| ^|^| ^|  ^|_____^|     ^| ^|^| ^|   \______.'  ^| ^|^| ^| ^|____^|^|____^| ^| ^|
echo ^| ^|              ^| ^|^| ^|              ^| ^|^| ^|              ^| ^|^| ^|              ^| ^|^| ^|              ^| ^|^| ^|              ^| ^|^| ^|              ^| ^|
echo ^| '--------------' ^|^| '--------------' ^|^| '--------------' ^|^| '--------------' ^|^| '--------------' ^|^| '--------------' ^|^| '--------------' ^|
echo  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'

color 0C
echo -------------------------------------
echo ^¡Recuerda que se restauraran todos los planes de energia!^
echo -------------------------------------
color 0E




echo ============================================
echo     Script de Configuracion de CPU Turbo
echo ============================================
echo.

:: Paso 0: Restaurar planes de energía
echo [05%%] Restaurando planes de energia a valores de fabrica...
powercfg -restoredefaultschemes >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [ERROR] No se pudieron restaurar los planes de energia.
    pause
    exit /b
)
color 0A
echo [OK] Planes de energia restaurados.
echo.

:: Paso 1: Obtener GUID del plan activo
color 0E
echo [10%%] Obteniendo GUID del plan de energia...
for /f "tokens=2 delims=:(" %%G in ('powercfg /getactivescheme') do set GUID=%%G
set GUID=%GUID: =%
if "%GUID%"=="" (
    color 0C
    echo [ERROR] No se pudo obtener el plan de energia activo.
    pause
    exit /b
)
color 0A
echo [OK] Plan activo: %GUID%
echo.

:: Preguntar al usuario
color 0B
set /p choice="¿Quieres [A]ctivar o [D]esactivar Turbo Boost? "
echo.

if /I "%choice%"=="D" (
    :: Paso 2: Modificar el registro para mostrar la opción
    color 0E
    echo [30%%] Modificando el Registro para revelar la opcion...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 2 /f >nul
    if %errorlevel% neq 0 (
        color 0C
        echo [ERROR] No se pudo modificar el registro.
        pause
        exit /b
    )
    color 0A
    echo [OK] Registro modificado correctamente.
    echo.

    :: Paso 3: Desactivar Boost Mode
    color 0E
    echo [60%%] Configurando Boost Mode como DESHABILITADO...
    powercfg /setacvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 0 >nul
    powercfg /setdcvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 0 >nul
    if %errorlevel% neq 0 (
        color 0C
        echo [ERROR] No se pudo configurar el plan de energia.
        pause
        exit /b
    )
    color 0A
    echo [OK] Boost Mode DESHABILITADO.
    echo.

) else if /I "%choice%"=="A" (
    :: Paso 2: Modificar el registro para mostrar la opción
    color 0E
    echo [30%%] Modificando el Registro para revelar la opcion...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\be337238-0d82-4146-a960-4f3749d470c7" /v Attributes /t REG_DWORD /d 2 /f >nul
    if %errorlevel% neq 0 (
        color 0C
        echo [ERROR] No se pudo modificar el registro.
        pause
        exit /b
    )
    color 0A
    echo [OK] Registro modificado correctamente.
    echo.

    :: Paso 3: Activar Boost Mode
    color 0E
    echo [60%%] Configurando Boost Mode como HABILITADO...
    powercfg /setacvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 2 >nul
    powercfg /setdcvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 2 >nul
    if %errorlevel% neq 0 (
        color 0C
        echo [ERROR] No se pudo configurar el plan de energia.
        pause
        exit /b
    )
    color 0A
    echo [OK] Boost Mode HABILITADO.
    echo.

) else (
    color 0C
    echo Opción no válida. Saliendo...
    pause
    exit /b
)

:: Paso 4: Aplicar cambios
color 0E
echo [90%%] Aplicando cambios...
powercfg /S %GUID%
timeout /t 2 >nul

:: Finalizado
color 0A
echo [100%%] Operacion completada con exito.
echo Turbo Boost configurado segun tu eleccion y planes restaurados.
echo.
pause
