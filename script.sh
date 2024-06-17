#!/bin/bash

# Obtener todos los nombres de los escritorios
desktops=$(bspc query -D --names)

# Inicializar la variable de salida
status=""

# Iterar sobre cada escritorio
for desktop in $desktops; do
    # Comprobar si el escritorio está ocupado
    if bspc query -N -d $desktop > /dev/null; then
        status="${status} 󰊠 "
    else
        status="${status}  "
    fi
done

# Imprimir el estado formateado
echo $status

