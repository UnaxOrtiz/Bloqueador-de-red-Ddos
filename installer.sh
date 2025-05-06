#!/bin/bash

function Title {
	clear
	echo
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

# Función para manejar la selección de idioma en un bucle
select_language() {
	local opc=""
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
					# Copiar el archivo, asumiendo que quieres que se llame inhibitor.sh
					cp requisitos/es/inhibitor.sh ./inhibitor.sh
					if [ $? -ne 0 ]; then
						echo "Error al copiar el archivo en español. Asegúrate de que 'requisitos/es/inhibitor.sh' existe."
						exit 1
					fi
					;;
				2 )	echo "[*] Seleccionado: English"
					# Copiar el archivo
					cp requisitos/en/inhibitor.sh ./inhibitor.sh
					if [ $? -ne 0 ]; then
						echo "Error al copiar el archivo en inglés. Asegúrate de que 'requisitos/en/inhibitor.sh' existe."
						exit 1
					fi
					;;
				3 )	echo "[*] Saliendo..."
					exit 0
					;;
				* )	echo "[!] Opcion no valida / Invalid option." # Eliminado $RRPLY
					sleep 2
					clear # Limpiar antes de mostrar el menú de nuevo
		esac
	done
}

# Solo ejecutar la instalación si el script se ejecuta directamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	select_language # Llamar a la función de selección de idioma

	echo "[*] Instalando dependencias..."
	# Usar apt consistentemente y corregir netdiscover typo
	sudo apt update # Buena práctica antes de instalar
	sudo apt install -y hping3 aircrack-ng mdk4 gnome-terminal bettercap netdiscover macchanger

	# Verificar si la instalación fue exitosa (básico)
	if [ $? -ne 0 ]; then
		echo "Error durante la instalación de los paquetes. Revisa los mensajes anteriores."
		exit 1
	fi
	echo "[*] Dependencias instaladas correctamente."

	# Corregir el chmod (quitando -y y usando permisos razonables)
	echo "[*] Estableciendo permisos para inhibitor.sh..."
	chmod 755 inhibitor.sh # Permisos de ejecución para dueño, grupo y otros
	# Puedes usar 700 si solo tú vas a ejecutarlo

	# Ejecutar el script principal si la copia y permisos fueron correctos
	if [ -x "./inhibitor.sh" ]; then # Verificar que el archivo existe y es ejecutable
		echo "[*] Ejecutando inhibitor.sh..."
		bash ./inhibitor.sh
	else
		echo "[!] No se pudo encontrar o ejecutar el archivo inhibitor.sh. Revisa los pasos anteriores."
		exit 1
	fi
fi