####-----------escritorios_activos_en_hyprland---------#####
##!/bin/bash

## Obtener la lista de escritorios y ventanas usando hyprctl
#workspaces=$(hyprctl workspaces -j)
#clients=$(hyprctl clients -j)

## Extraer IDs de escritorios con ventanas abiertas
#active_workspace_ids=$(echo "$clients" | jq -r '[.[] | .workspace.id] | unique[]')

## Inicializar variable para almacenar nombres de escritorios
#active_workspaces=""

## Construir la lista de nombres de los escritorios con ventanas abiertas
#for id in $active_workspace_ids; do
#    workspace_name=$(echo "$workspaces" | jq -r --arg id "$id" '.[] | select(.id == ($id | tonumber)) | .name')
#    active_workspaces="$active_workspaces $workspace_name"
#done

## Mostrar los nombres de los escritorios en una sola línea
#echo "$active_workspaces"




####----------------------BSPWM------------------------#####
##!/bin/bash

## Obtener todos los nombres de los escritorios
#desktops=$(bspc query -D --names)

## Emojis para escritorios
#empty_emojis=("" "" "" "" "" "")
#occupied_emojis=(" " " " " " "󰴓 " "󰊠 " "󱍢 ")

## Inicializar la variable de salida
#status=""

## Contador de escritorios
#index=0

## Iterar sobre cada escritorio
#for desktop in $desktops; do
#    # Comprobar si el escritorio está ocupado
#    if bspc query -N -d $desktop > /dev/null; then
#        status=" ${status} ${occupied_emojis[$index]} "  # Emoji para ocupado
#    else
#        status=" ${status} ${empty_emojis[$index]} "  # Emoji para vacío
#    fi
#    ((index++))
#done

## Imprimir el estado formateado
#echo $status


# intalar  sudo pacman -S jq 



