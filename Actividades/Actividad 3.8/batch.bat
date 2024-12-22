@echo off
setlocal enabledelayedexpansion

REM Creamos un archivo de inventario.txt si no existe
if not exist inventario.txt (
    echo Inventario de productos > inventario.txt
)

REM Menu principal
:menu

echo =======================
echo =Gestion de Inventario=
echo =======================

echo 1. Agregar producto
echo 2. Ver Inventario
echo 3. Eliminar producto
echo 4. Buscar producto
echo 5. Salir
echo =======================

REM Pedimos al usuario que seleccione una opción
set /p opcion="Seleciona una opcion: "

REM Verificamos la opción seleccionada
if "%opcion%"=="1" (
    goto agregarProducto

) else if "%opcion%"=="2" (
    goto verInventario

) else if "%opcion%"=="3" (
    goto eliminarProducto

) else if "%opcion%"=="4" (
    goto buscarProducto

) else if "%opcion%"=="5" (
    exit

) else (
    REM Si la opción no es válida, mostramos un mensaje y regresamos al menú
    echo Opcion no valida. Intenta de nuevo.
    pause
    goto menu
)

REM SECCIÓN PARA AGREGAR PRODUCTO AL INVENTARIO
:agregarProducto
cls
echo ========================
echo    AGREGAR PRODUCTO 
echo ========================
REM Solicitamos al usuario los datos del producto (nombre, cantidad, precio)
set /p producto="Ingrese el nombre del producto: "
set /p cantidad="Ingrese la cantidad del producto: "
set /p precio="Ingrese el precio del producto: "

REM Guardamos los datos del producto en el archivo inventario.txt
echo !producto! - !cantidad! - !precio! >> inventario.txt
REM Mostramos un mensaje de confirmación
echo Producto agregado con exito: !producto!, !cantidad! unidades a !precio! euros
pause
goto menu

REM SECCIÓN PARA VER EL INVENTARIO
:verInventario
cls
echo ==========================
echo      VER INVENTARIO 
echo ==========================
echo Producto  Cantidad  precio
echo ==========================

REM Mostramos todo el contenido del archivo inventario.txt
type inventario.txt

pause 
goto menu

REM SECCIÓN PARA ELIMINAR UN PRODUCTO
:eliminarProducto
cls
echo ==========================
echo     ELIMINAR PROFUCTO
echo ==========================

REM Solicitamos al usuario el nombre del producto a eliminar
set /p productoEliminar="Ingrese el producto que deseas eliminar: "

REM Creamos un archivo temporal para actulizar el inventario
set tempFile=inventario_temp.txt
if exist %tempFile% del %tempFile%

REM Buscamos el producto y lo eliminamos de inventario.txt
for /f "tokens=*" %%a in (inventario.txt) do (
    REM Usamos findstr para verificar si la línea contiene el producto a eliminar
    echo %%a | findstr /i /v "!productoEliminar!" >> %tempFile%
)

REM Reemplazamos el archivo original con el archivo temporal 
move /y %tempFile% inventario.txt

REM Mostramos un mensaje de confirmación
echo Producto eliminado con exito: !productoEliminar!
pause
goto menu

REM SECCIÓN PARA BUSCAR UN PRODUCTO EN EL INVENTARIO
:buscarProducto
cls
echo ==========================
echo     BUSCAR PRODUCTO
echo ==========================

REM Solicitamos al usuario el nombre del producto que desea buscar
set /p productoBuscar="Introduce el producto que deseas buscar: "

REM Buscar el producto en el inventario
echo Buscando "%productoBuscar%" en el inventario...
timeout /t 3

echo ===========================
REM Recorremos el archivo inventario.txt para encontrar el producto
for /f "tokens=*" %%a in (inventario.txt) do (
    REM Usamos findstr para buscar el producto dentro de cada línea
    echo %%a | findstr /i "%productoBuscar%" >nul
    REM Si encontramos el producto, lo mostramos
    if !errorlevel! EQU 0 (
        echo Producto encontrado: %%a
    )
)
REM Mensaje final de búsqueda
echo ====================
echo Busquedad Finalizada
pause
goto menu