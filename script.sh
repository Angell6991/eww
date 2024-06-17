#!/bin/bash

# Obtener todos los nombres de los escritorios
desktops=$(bspc query -D --names)

# Emojis para escritorios
empty_emojis=("" "" "" "" "" "")
occupied_emojis=(" " " " " " "󰴓 " "󰊠 " "󱍢 ")

# Inicializar la variable de salida
status=""

# Contador de escritorios
index=0

# Iterar sobre cada escritorio
for desktop in $desktops; do
    # Comprobar si el escritorio está ocupado
    if bspc query -N -d $desktop > /dev/null; then
        status=" ${status} ${occupied_emojis[$index]} "  # Emoji para ocupado
    else
        status=" ${status} ${empty_emojis[$index]} "  # Emoji para vacío
    fi
    ((index++))
done

# Imprimir el estado formateado
echo $status

