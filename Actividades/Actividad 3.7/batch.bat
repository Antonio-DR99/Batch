@echo off
setlocal enabledelayedexpansion
REM Crea un progrma, empleando vectores
REM Cambie el color de fondo de la terminal 10 veces, con 1 segundo de diferencia cada una de ellas entre un color y otro, e indique de qué color se trata en cada iteración

REM Creamos un vector de colores de fondo: 
set color[0]=0
set color[1]=1
set color[2]=2
set color[3]=3
set color[4]=4
set color[5]=5
set color[6]=6
set color[7]=7
set color[8]=0
set color[9]=1

REM Usamos un bucle para aplicar todos lo colores de fondo
for /l %%i in (0,1,10) do (
    set "fondo_color=!color[%%i]!"
    color !fondo_color!7
    echo Color de fondo: !fondo_color!
    timeout /t 1
)
endlocal