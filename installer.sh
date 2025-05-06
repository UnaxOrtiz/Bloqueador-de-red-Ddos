#!/bin/bash

# Función para mostrar el título y banner
function Title {
	clear
	echo
	# Arte ASCII (puede tener caracteres especiales, asegúrate de guardarlo con codificación UTF-8 y finales de línea Unix)
	echo "  _____        _      _      _      _      _             _          "
    echo " |_   _|      (_)    | |    (_)    | |    (_)           (_)         "
    echo "   | |   ___  _ __| |     _ __| |     _ ___   ___   _   ___ ___"
    echo "   | |  / _ \| |/ _` |    | |/ _` |    | |/ _ \ / __| | | / __/ _ \""
    echo "  _| |_| (_) | | (_| |    | | (_| |    | | (_) | (__  | || (_|  __/"
    echo " |_____|\___/|_|\__,_|    |_|\__,_|    |_|\___/ \___| |_| \___\___|"
    echo "________________________________________________________________ "
    echo "            Inhibitor_Intrusos                         "

	echo "      ︻╦̵̵͇̿̿̿̿╤── Creado Por: Mr.Robot2006 v2.0  ︻╦̵̵͇̿̿̿̿╤──      "
	echo "-------------------------------------------------------------------------------------------"
	echo " Cualquier acción y o actividad relacionada con Inhibitor es únicamente su responsabilidad"
	echo "-------------------------------------------------------------------------------------------"
	echo
	echo
}

# Función para manejar la selección de idioma y copia de archivo
select_language() {
	local opc="" # Variable local para la opción elegida

	# Bucle para pedir la opción hasta que sea válida (1 o 2) o el usuario elija salir (3)
	while [[ "$opc" != "1" && "$opc" != "2" ]]; do
		Title # Mostrar el título en cada intento

		echo "[*] Elige idioma / Select language"
		echo
		echo "#####################"
		echo "[1] Español/es"
		echo "[2] English/en"
		echo "[3] Salir"
		echo "#####################"
		echo
		read -p "[*] Elige una opcion / Choose one option: " opc

		case $opc in
				1 )	echo "[*] Seleccionado: Español"
					# Copiar el archivo en español al nombre inhibitor.sh en el directorio actual
					# Verifica si el archivo fuente existe antes de intentar copiar
					if [ -f "requisitos/es/inhibitor.sh" ]; then
						cp requisitos/es/inhibitor.sh ./inhibitor.sh
						# Verificar si la copia fue exitosa
						if [ $? -ne 0 ]; then
							echo "[!] Error al copiar el archivo 'requisitos/es/inhibitor.sh'. Asegúrate de tener permisos."
							exit 1 # Salir si falla la copia
						fi
					else
						echo "[!] Error: El archivo 'requisitos/es/inhibitor.sh' no se encuentra."
						echo "[!] Asegúrate de que la carpeta 'requisitos' y sus contenidos están en el mismo directorio que installer.sh."
						exit 1 # Salir si el archivo fuente no existe
					fi
					;; # Termina la opción 1

				2 )	echo "[*] Seleccionado: English"
					# Copiar el archivo en inglés al nombre inhibitor.sh en el directorio actual
					# Verifica si el archivo fuente existe antes de intentar copiar
					if [ -f "requisitos/en/inhibitor.sh" ]; then
						cp requisitos/en/inhibitor.sh ./inhibitor.sh
						# Verificar si la copia fue exitosa
						if [ <span class="math-inline">? \-ne 0 \]; then
echo "\[\!\] Error al copiar el archivo 'requisitos/en/inhibitor\.sh'\. Asegúrate de tener permisos\."
exit 1 \# Salir si falla la copia
fi
else
echo "\[\!\] Error\: El archivo 'requisitos/en/inhibitor\.sh' no se encuentra\."
echo "\[\!\] Asegúrate de que la carpeta 'requisitos' y sus contenidos están en el mismo directorio que installer\.sh\."
exit 1 \# Salir si el archivo fuente no existe
fi
;; \# Termina la opción 2
3 \)	echo "\[\*\] Saliendo\.\.\."
exit 0 \# Salir limpiamente si el usuario elige 3
;; \# Termina la opción 3
\* \)	\# Opción por defecto para entradas no válidas
echo "\[\!\] Opcion no valida / Invalid option\."
sleep 2 \# Espera un poco antes de limpiar y mostrar el menú de nuevo
clear \# Limpiar la pantalla para el siguiente intento
;; \# Termina la opción por defecto
esac
done \# Fin del bucle while
\}
\# \-\-\- Inicio de la ejecución principal del script \-\-\-
\# Esto solo se ejecuta si el script se llama directamente \(no si se 'sourcea'\)
if \[\[ "</span>{BASH_SOURCE[0]}" == "${0}" ]]; then

	# Llama a la función para seleccionar