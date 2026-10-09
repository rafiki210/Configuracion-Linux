#!/bin/bash
# ══════════════════════════════════════════════════════════════
#  dashboard.sh — Abre el workspace 1 con calcurse + terminal
#  Copia a: ~/.config/i3/dashboard.sh
#  Luego: chmod +x ~/.config/i3/dashboard.sh
# ══════════════════════════════════════════════════════════════

sleep 1.5   # Espera a que i3 termine de cargar

# Ir al workspace 1
i3-msg 'workspace "1"'
sleep 0.3

# Panel izquierdo: calcurse a pantalla completa vertical
alacritty --title "calcurse-dashboard" -e calcurse &
sleep 0.8

# Split derecho: terminal libre
i3-msg 'split h'
alacritty --title "terminal" &
sleep 0.5

# Calcurse ocupa ~40% del ancho, terminal el resto
i3-msg '[title="calcurse-dashboard"] resize set 380 0'

# Conky siempre visible (overlay sobre el desktop)
pkill conky 2>/dev/null
sleep 0.3
conky -c ~/.config/conky/warm.conf &
