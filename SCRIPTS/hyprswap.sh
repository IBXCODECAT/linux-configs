#!/bin/bash

# Define paths correctly
LINK_TARGET="/home/$USER/.config/hypr/hyprland.conf"
FANCY_CONF="/home/$USER/.config/hypr/fancy.hyprland.conf"
MINIMAL_CONF="/home/$USER/.config/hypr/minimal.hyprland.conf"

# Identify what is currently active
CURRENT_TARGET=$(readlink -f "$LINK_TARGET")

if [ "$CURRENT_TARGET" == "$FANCY_CONF" ]; then
    # Currently Fancy, so switch to Minimal
    ln -sf "$MINIMAL_CONF" "$LINK_TARGET"
    notify-send -a "Hyprland" -c "warning" "Config Swapped" "Now using: Minimal Mode"
else
    # Currently Minimal (or anything else), so switch to Fancy
    ln -sf "$FANCY_CONF" "$LINK_TARGET"
    notify-send -a "Hyprland" -c "message" "Config Swapped" "Now using: Fancy Mode"
fi

hyprctl reload
