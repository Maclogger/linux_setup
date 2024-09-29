#!/bin/bash

# Tento skript slúži na zjednodušenie procesu tvorby Laravel projektu

projects_dir="/home/mclogger/Desktop/LaravelProjects/"
laravel_new_project_url="curl -s https://laravel.build/__APP_NAME__ | bash"

# Funkcia na získanie zoznamu projektov
list_projects() {
  echo "Tvoje Laravel Projekty:"
  i=1
  project_names=()
  for project in "$projects_dir"*/; do
    if [[ -d "$project" ]]; then
      project_name=$(basename "$project")
      if [[ ${#project_name} -ge 2 ]]; then
        echo "[$i]: $project_name"
        project_names+=("$project_name")
        ((i++))
      fi
    fi
  done
  echo "[0]: Nový projekt"
  echo ""
}

# Funkcia na získanie posledného modifikovaného projektu
get_last_project() {
  last_project_dir=$(ls -td "$projects_dir"*/ 2>/dev/null | head -1)
  if [[ -n "$last_project_dir" ]]; then
    last_project_name=$(basename "$last_project_dir")
  else
    last_project_name=""
  fi
}

# Funkcia na vytvorenie nového projektu
create_new_project() {
  read -r -p "Zadaj názov projektu: " sel_project_name
  # Nahradí __APP_NAME__ názvom projektu v URL
  project_url="${laravel_new_project_url/__APP_NAME__/"$sel_project_name"}"

  cd "$projects_dir" || exit

  # Vytvorí nový Laravel projekt s Docker podporou
  eval "$project_url"

  # Nastavíme sel_project_name na úplnú cestu k projektu
  sel_project_name="$projects_dir$sel_project_name"

  echo ""
  echo "Projekt $sel_project_name bol úspešne vytvorený."
}

# Funkcia na spustenie databázy a localhostu
start_sail() {
  local project_path="$1"
  cd "$project_path" || exit
  ./vendor/bin/sail up -d
}

# Funkcia na výber projektu
select_project() {
  read -r -p "Tvoja voľba (stlač Enter pre posledný projekt): " choice

  if [[ -z "$choice" ]]; then # Zadal prázdny reťazec => zvolí posledný projekt
    if [[ -n "$last_project_name" ]]; then
      sel_project_name="$last_project_dir"
      echo "Spúšťam DB pre posledný projekt $last_project_name"
    else
      echo "Nie sú dostupné žiadne projekty."
      exit 1
    fi
  elif [[ "$choice" -eq 0 ]]; then
    create_new_project
  else
    if ((choice > 0 && choice <= ${#project_names[@]})); then
      sel_project_name="$projects_dir${project_names[$choice - 1]}"
      echo "Vybral si si projekt $sel_project_name"
    else
      echo "Neplatná voľba."
      exit 1
    fi
  fi
}

# Hlavný tok skriptu
main() {
  echo ""
  echo "Vitaj Marek!"
  echo ""
  get_last_project               # Získanie posledného projektu
  list_projects                  # Vypísanie zoznamu projektov
  select_project                 # Výber projektu alebo vytvorenie nového
  start_sail "$sel_project_name" # Spustenie databázy a localhostu
}

# Spustenie hlavnej funkcie
main
