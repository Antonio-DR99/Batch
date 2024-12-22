@echo off

REM  le pases como parámetro tu nombre y que visualiza el mensaje de bienvenida "Hola, {nombre}, has llegado a la mejor aplicación
set /p nombre= Introduce tu nombre:

REM Este mensaje debe estar "adornado" de forma que no sea sólo una frase
echo =========================================================
echo = Hola, %nombre%, Has llegado a la mejor aplicacion =
echo =========================================================      
  

REM Pedir al usuario que introduzca un número entero mayorr a 10
set /p numero= Introduce un numero entero mayor a 10:
if "%numero%" LEQ 10 (
    echo El numero debe ser mayor a 10
)

REM Cramos el directorio con el nombre minipinza
mkdir minipinza

REM Cambiamos al directorio minipinza
cd minipinza

REM Creamos archivos de 2MB en el directorio minipinza
setlocal enabledelayedexpansion
for /l %%i in (1,3,%numero%) do (
    fsutil file createnew %nombre%-%%i.txt 2097152
)
endlocal

REM Mostramos los archivos creados
echo =========================================================
echo Archivos creados exitosamente en el directorio "minipinza".
echo =========================================================

REM Por último, deberá mostrar de nuevo el mensaje de bienvenida y esperar la pulsación de una tecla, tras la cual borrará el directorio minipinza.
echo =========================================================
echo = Hola, %nombre%, Espero que te haya gustado =
echo =========================================================

REM volvemos al directorio anterior
cd  ..

REM esperamos 5 segundos
timeout /t 5

REM borramos el directorio minipinza
rmdir minipinza /s /q

 