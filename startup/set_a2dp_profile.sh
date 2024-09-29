#!/bin/bash

# Definuj názov zariadenia (Bluetooth adresu nájdeš vo výpise)
BT_DEVICE="bluez_card.AC_BF_71_8B_C6_F1"

# Nastav profil na A2DP (vysoká kvalita zvuku)
pactl set-card-profile $BT_DEVICE a2dp-sink

