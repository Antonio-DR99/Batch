@echo off

REM Crear una aplicacion en batch que: 

REM Cambiate al directorio PUBLIC
cd Public

REM El programa debe pedirte el nombre de un archivo
echo Introduce el nombre del archivo: 

REM Solicita al usuario que ingrese un nombre para el archivo base
set /p name=

REM Mostrar el nombre del archivo
echo El nombre del archivo es: %name%

REM Crea 10 archivos cuyo nombre se incremente de uno en uno y cuyo 
REM contenido sea el nombre del archivo repetido 10 veces

for /l %%i in (1,1,10) do (
    REM Recorre un bucle desde 1 hasta 10, incrementando de uno en uno
    REM En cada vuelta crea un archivo con un nombre que incluye el índice actual
    echo %name% %name% %name% %name% %name% %name% %name% %name% %name% %name% > %name%%%i.txt
)
echo Creado con exito

REM Visualiza cada uno de los archivos creados
for /l %%i in (1,1,10) do (
    REM Otro bucle que recorre desde 1 hasta 10 para visualizar el contenido de los archivos creados

    echo Archivo de %name%%%i.txt:

    REM Usa el comando type para leer y mostrar el contenido del archivo en la consola
    type %name%%%i.txt
    echo.
)

REM Pausa la ejecución del programa durante 5 segundos para que el usuario tenga tiempo de ver los resultados
timeout /t 5

REM Elimina tos los archivos creados
for /l %%i in (1,1,10) do (
    REM Recorre otro bucle desde 1 hasta 10 para eliminar los archivos creados anteriormente
    REM Usa el comando del para eliminar el archivo correspondiente a cada iteración.
    del %name%%%i.txt
)
echo Archivos eliminados 