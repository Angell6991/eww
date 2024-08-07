#!/bin/bash

# Obtener la lista de escritorios y ventanas usando hyprctl
workspaces=$(hyprctl workspaces -j)
clients=$(hyprctl clients -j)

# Extraer IDs de escritorios con ventanas abiertas
active_workspace_ids=$(echo "$clients" | jq -r '[.[] | .workspace.id] | unique[]')

# Definir emojis por número de escritorio (puedes personalizar estos emojis según tu preferencia)
emojis=(" " " " " " "󰴓 " "󰊠 " "󱍢 ")

# Inicializar variable para almacenar emojis de los escritorios con ventanas abiertas
active_workspaces=""

# Construir la lista de emojis de los escritorios con ventanas abiertas
for id in $active_workspace_ids; do
    workspace_name=$(echo "$workspaces" | jq -r --arg id "$id" '.[] | select(.id == ($id | tonumber)) | .name')
    # Obtener el emoji correspondiente al número de escritorio (si hay menos de 10 escritorios, ajusta el tamaño del arreglo emojis)
    emoji=${emojis[$(($id - 1))]}  # Restamos 1 porque los arrays en bash son base 0
    active_workspaces="$active_workspaces $emoji"
done

# Verificar si no hay ventanas activas y establecer el string en "none" en ese caso
if [ -z "$active_workspaces" ]; then
    active_workspaces="󰮯  󰫮󰫿󰫰󰫵 󰊠 "
fi

# Mostrar los emojis de los escritorios en una sola línea
echo "$active_workspaces"


# intalar  sudo pacman -S jq 


