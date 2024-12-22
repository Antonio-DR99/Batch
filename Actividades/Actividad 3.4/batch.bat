@echo off
setlocal enabledelayedexpansion
REM Este programa genera una cadena de archivos Actividad3.4-X.bat

REM Limite de archivos a generar
set limite=5
REM La variable "limite" define hasta qué número de archivos se generarán. 
REM En este caso, se generarán desde Actividad3.4-0.bat hasta Actividad3.4-5.bat.

REM Crear los archivos en un bucle
for /l %%i in (0,1,%limite%) do (
    REM Este bucle recorre un rango de números desde 0 hasta el valor del "limite".
    REM %%i es la variable que contiene el número actual en la iteración.

    REM Nombre del archivo actual
    set "archivo=Actividad3.4-%%i.bat"
    REM La variable "archivo" contiene el nombre del archivo que se está generando en esta iteración.

    REM Generar el contenido del siguiente archivo
    (
        echo @echo off
        echo REM Este archivo genera Actividad3.4-%%i.bat
        REM Agrega líneas al archivo actual. Estas líneas son el código del archivo generado.

        if %%i lss %limite% (
            REM Si el archivo actual no es el último, calcula el índice del siguiente archivo
            set /a next=%%i+1
            REM next almacena el número del siguiente archivo a crear.

            echo echo @echo off ^> Actividad3.4-!next!.bat
            REM Esta línea genera el inicio del contenido del siguiente archivo.

            echo echo echo Este archivo genera Actividad3.4-!next!.bat ^> Actividad3.4-!next!.bat
            REM Agrega un comentario al archivo generado para que explique lo que hace.

            echo echo pause ^>^> Actividad3.4-!next!.bat
            REM Agrega una pausa al archivo generado para que el usuario pueda ver su ejecución.
        ) else (
            REM Si estamos en el último archivo, escribe un mensaje de fin
            echo echo Fin de la cadena
            echo echo pause
        )
    ) > "!archivo!"
    REM Toda la salida dentro de los paréntesis se redirige al archivo con nombre "!archivo!".

    REM Confirmar que el archivo se creó
    echo Generado: !archivo!
    REM Muestra un mensaje en la consola indicando que se ha creado el archivo.
)

pause
REM Pausa al final del script para que el usuario pueda ver los mensajes.