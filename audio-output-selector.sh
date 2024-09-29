#!/bin/bash

declare -A NAMES
declare -A PROFILES
declare -A CARD_NAMES
declare -A CONNECTED

NAMES[1]="C34J79x"
PROFILES[1]="output:hdmi-stereo-extra1"

NAMES[2]="Marekov kúsok pokoja"
PROFILES[2]="a2dp-sink"

NAMES[3]="AirPods Pro"
PROFILES[3]="a2dp-sink"

pocet_zariadeni=${#NAMES[@]}

find_name() {
  local index=$1
  nazov="${NAMES[$index]}"

  text=$(pactl list cards)
  card_section=$(echo "$text" | awk -v RS="\n\n" -v search="$nazov" '
      $0 ~ search { print; exit }
  ')
  card_name=$(echo "$card_section" | awk '/Name: / { print $2 }')
  CARD_NAMES[$index]="$card_name"
  # echo "[$index] ${NAMES[$index]} - ${CARD_NAMES[$index]}"
}

find_all_names() {
  for i in $(seq 0 $((pocet_zariadeni - 1))); do
    find_name "$i"
    if [ -n "${CARD_NAMES[$i]}" ] && [ "${CARD_NAMES[$i]}" != " " ]; then
      CONNECTED[$i]=true
    else
      CONNECTED[$i]=false
    fi
  done
}

show_options() {
  echo "Dostupné zariadenia:"
  for i in $(echo "${!NAMES[@]}" | tr ' ' '\n' | sort -n); do
    if [ "${CONNECTED[$i]}" = true ]; then
      echo "[$i] (CONNECTED): ${NAMES[$i]} - ${CARD_NAMES[$i]}"
    else
      echo "[$i] (NOT CONNECTED): ${NAMES[$i]}"
    fi
  done
}

vyber_moznost() {
  # Skontrolovanie, či nebol zadaný parameter
  if [ -z "$1" ]; then
    # Ak nebol zadaný parameter, zobrazí zoznam možností
    show_options
    read -r -p "Vyber zariadenie: " selected_index
  else
    # Ak bol zadaný parameter, máme hotovo
    selected_index=$1
  fi
  if [ -z "${CONNECTED[$selected_index]}" ] || [ "${CONNECTED[$selected_index]}" = false ]; then
    echo ""
    echo "Nesprávny index / zariadenie nie je pripojené!"
    exit 1
  fi
}

nastav_profil() {
  if [ -n "${PROFILES[$i]}" ] && [ "${PROFILES[$i]}" != " " ]; then
    eval pactl set-card-profile "${CARD_NAMES[$selected_index]}" "${PROFILES[$selected_index]}"
  fi
}

set_sink_name() {
  text=$(pactl list sinks)
  sink_section=$(echo "$text" | awk -v RS="\n\n" -v search="${CARD_NAMES[$selected_index]}" '
      $0 ~ search { print; exit }
  ')
  sink_name=$(echo "$sink_section" | awk '/Name: / { print $2 }')
}

move_streams() {
  for INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
    eval pactl move-sink-input "$INPUT" "$1"
  done
}

set_current_audio_device() {
  set_sink_name
  eval pactl set-default-sink "$sink_name"
  move_streams "$sink_name"
}

find_all_names
vyber_moznost "$1"
nastav_profil
set_current_audio_device
