@echo off

REM Antonio De La Rosa Riquelme

REM Limìar pantalla
cls

REM Pedir tu nombre por consola
echo Introduce tu nombre: 
set /p nombre=

REM Mostar un saludo
echo Hola, %nombre% Bienvenido

REM Cambiar el titulo de la ventana a tu nombre
title %nombre%

REM Crear un directorio con tu nombre, dentro del cual hay otro, con tu nombre y un numero aleatorio repetido 10 veces 
REM Creamos el directorio y dentro del el, el segundo directorio
mkdir "%nombre%\%nombre2%"

REM Cambiamos al directorio que hemos creado anteriormente 
cd "%nombre%\%nombre2%"

REM Definimos un nombre para los subdirectorios 
set subdirectorio=subAntonio

setlocal enabledelayedexpansion 
for /l %%a in (1,1,10) do (

    REM Generamos un numero aleatotio
    set /a num=!random!

    REM Creamos los subdirectorios con el nombre y el nuemro aleatorio
    mkdir !subdirectorio!_!num!

    REM Mostramos los directorios creados
    echo Creado: !subdirectorio!_!num!
)

REM Creamos un directorio llamdo "Datos Distribuidos" en el directorio con tu nombre
mkdir "Datos Distribuidos"

REM Haga una pausa de 10 segundos 
timeout /t 10

REM Volver a la carpeta anterior 
cd ..

REM Borramos el directorio inicial que tiene tu nombre (y dentro del caul se encuentra todos los demas)
rmdir "%nombre%" /s /q 

