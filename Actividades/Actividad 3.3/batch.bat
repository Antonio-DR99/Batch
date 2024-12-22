@echo off@echo off

REM Lanzar 2 aplicaciones: notepad.exe y calc.exe
echo Abriendo aplicaciones...
start notepad.exe
start calc.exe

REM Esperamos 5 segundos
timeout /t 5 

REM muestre en un archivo llamado ActividadNoteCalc.txt todas las tareas que están funcionando en tu ordenador tras lanzar esas 2 aplicaciones.
tasklist > ActividadNoteCalc.txt

REM Escriba en el archivo ActividadNoteCalc.txt la fecha y hora, junto a tu nombre completo
echo Fecha: %date% >> ActividadNoteCalc.txt
echo Hora: %time% >> ActividadNoteCalc.txt
echo Nombre: Antonio De La Rosa Riquelmee >> ActividadNoteCalc.txt   

REM Mostrar el ActividadNoteCalc.txt
type ActividadNoteCalc.txt

REM Mate los procesos de esas 2 aplicaciones.
echo Cerrando aplicaciones...
taskkill /f /im notepad.exe 
taskkill /f /im calc.exe

REM Lanzar 2 aplicaciones: notepad.exe y calc.exe
echo Abriendo aplicaciones...
start notepad.exe
start calc.exe

REM Esperamos 5 segundos
timeout /t 5 

REM muestre en un archivo llamado ActividadNoteCalc.txt todas las tareas que están funcionando en tu ordenador tras lanzar esas 2 aplicaciones.
tasklist > ActividadNoteCalc.txt

REM Escriba en el archivo ActividadNoteCalc.txt la fecha y hora, junto a tu nombre completo
echo Fecha: %date% >> ActividadNoteCalc.txt
echo Hora: %time% >> ActividadNoteCalc.txt
echo Nombre: Antonio De La Rosa Riquelmee >> ActividadNoteCalc.txt   

REM Mostrar el ActividadNoteCalc.txt
type ActividadNoteCalc.txt

REM Mate los procesos de esas 2 aplicaciones.
echo Cerrando aplicaciones...
taskkill /f /im notepad.exe 
taskkill /f /im calc.exe