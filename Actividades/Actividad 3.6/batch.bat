@echo off
setlocal enabledelayedexpansion
REM Crea un programa que: 
REM 1. Figure en el codigo fuente tu nombre y apellido 
set /p nombre="Ingrese tu nombre completo: "

REM Mostramos un mensjae confirmando el nombre ingresado
echo =======================================================
echo = Hola %nombre%, Has quedado registrado en el codigo. =
echo =======================================================

REM Escribimos los datos del usario en el codigo fuente
echo REM Registro: %nombre% >> %~f0

REM 2. Obtener el numero de serie del disco duro  
for /f "tokens=8 delims= " %%i in ('vol C:') do (
    set serie=%%i
)

REM Formatear el número de serie en el formato XXXX-XXXX
set serie_formateado=!serie:~0,4!-!serie:~4,4!
echo El numero de serie es: !serie_formateado!

endlocal
pause