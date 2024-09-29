#!/bin/bash

# Nastav premennú pre názov okna emulátora
emulator_name="Android Emulator - Medium_Phone_API_29:5554"

# Spusti emulátor na pozadí
~/Android/Sdk/emulator/emulator -avd Medium_Phone_API_29 &

# Slučka, ktorá bude čakať, kým sa okno emulátora objaví
while ! wmctrl -l | grep -q "$emulator_name"; do
  echo "Čakám na emulátor..."
  sleep 1
done

# Keď sa okno emulátora objaví, presuň ho na požadované súradnice (x=5400, y=350)
wmctrl -r "$emulator_name" -e 0,5400,350,-1,-1

# Nastav okno emulátora ako Always on Top
wmctrl -r "$emulator_name" -b add,above
