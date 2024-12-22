@echo off
setlocal enabledelayedexpansion
REM Cre un programa en batch que contenga un menu interactivo, de forma que: 

:menu
echo ==================
echo  PANEL DE CONTROL
echo ==================
echo 1. Abrir el navegador
echo 2. Abrir la calculadora
echo 3. Cambiar colo de la pantalla
echo 4. Mensaje Por Consola
echo 5. Salir
echo ====================

REM Solicitamos al usuario que elija una opción
set /p opcion="Seleciona alguna de las opciones: "

REM Verificamos la opción seleccionada y redirigimos a la etiqueta correspondiente
if %opcion%==1 (
    goto abrirNavegador

) else if %opcion%==2 (
    goto abrirCalculadora

) else if %opcion%==3 (
    goto cambiarColor

) else if %opcion%==4 (
    goto mensaje

) else if %opcion%==5 (
    exit

) else (
    REM Si la opción no es válida, mostramos un mensaje de error y volvemos al menú
    echo Opcion no valida introduce otro numero
    pause
    goto menu
)

REM 1. ABRIR EL NAVEGADOR Y QUE VISITE UNA PAGINA ESPECIFICA
:abrirNavegador
cls
echo ============================
echo ABRIR NAVEGADOR CON UNA URL
echo ============================

REM Asignamos la URL a una variable
set url=https://www.tecnologiaciber.com

REM Mostramos la URL que se abrirá
echo Abriendo navegador con la URL: %url%

REM Abrimos la URL en el navegador predeterminado
start "" "%url%"

REM Pausamos para que el usuario vea el mensaje antes de regresar al menú
pause
goto menu


REM 2. ABRIR LA CALCULADORA
:abrirCalculadora
cls
echo ======================
echo     CALCULADORA
echo ======================

REM Usamos el comando start para abrir la calculadora
start calc
pause 
goto menu 

REM Cambiar el color de la pantalla
:cambiarColor
cls
echo ================
echo   CAMBIAR COLOR
echo ================

REM Creamos un vector de colores de fondo (números que representan colores)
set color[0]=0
set color[1]=1
set color[2]=2
set color[3]=3
set color[4]=4
set color[5]=5
set color[6]=6
set color[7]=7
set color[8]=1
set color[9]=0

REM Usamos un bucle para aplicar todos los colores de fondo
for /l %%i in (0,1,9) do (
    REM Asignamos el color del fondo a la variable
    set "fondo_color=!color[%%i]!"

    REM Aplicamos el color de fondo usando el comando color
    color !fondo_color!7

    REM Pausamos un segundo para que el usuario vea el cambio de color
    echo Color de fondo: !fondo_color!
    timeout /t 1
)
REM Volvemos al menú
endlocal
pause 
goto menu

REM MENSAJE POR CONSOLA DICIENDO FELIZ NAVIDAD
:mensaje
cls
echo =======================
echo   MENSAJE POR CONSOLA
echo =======================

REM Mostramos el mensaje de "Feliz Navidad"
echo Feliz Navidad Que tengas unas buenas fiestas
echo =============================================

REM Pausamos para que el usuario vea el mensaje
pause 
goto menu