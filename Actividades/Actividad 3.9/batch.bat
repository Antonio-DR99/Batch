@echo off
setlocal enabledelayedexpansion 
REM Escribe un programa que tenga 10 archivos con nombre aleatorio 
REM y de extension txt en un directorio, de 2MB de tamaño

REM Directiorio donde se creara los archivos
mkdir Antonio



REM bucle para crear 10 archivos con nombre aleatorio
for /l %%i in (1,1,10) do (
    REM Generamos un numero aleatorio para el nombre del archivo
    set /a randomNum=!random! %% 9000 + 1000
    set "nombreArchivo=Antonio\archivo_!randomNum!.txt"

    REM Creamos un archivo vacio para comenzar 
    type nul > "!nombreArchivo!"

    REM Escribimos caracteres en el archivo has alcanzar 2MB 
    for /l %%a in (1,1,1024) do (
        echo Esta frase es para rellenar el archivo. >> "!nombreArchivo!"
    )

    REM Mostramos el nombre del archivo creado
    echo Se ha creado el archivo: !nombreArchivo!
)
pause

REM Renombrar los archivos agregando "copia_"
for %%f in (Antonio\*.txt) do (
    set "nombreArchivo=%%f"
    set "nombreNuevo=Antonio\copia_%%~nxf"

    REM Renombramos el archivo
    ren "%%f" "copia_%%~nxf"
    
    echo Renombrado: !nombreArchivo! a !nombreNuevo!
)
pause