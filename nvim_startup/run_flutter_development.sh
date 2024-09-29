#!/bin/bash

# Nastav premenné pre súradnice a názov skriptu
new_terminal_script="run_emulator.sh"
emulator_window_title="Emulator Terminal"

# Spusti nový terminál a ulož PID
gnome-terminal --title="$emulator_window_title" -- bash -c "bash '$new_terminal_script'; exec bash" &
terminal_pid=$!
