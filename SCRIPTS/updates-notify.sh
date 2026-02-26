#!/bin/bash

# Check Pacman updates safely
#PACMAN_COUNT = $(checkupdates | wc -l)
PACMAN_COUNT = 1

# Check FlatPak updates
#FLATPAK_COUNT = $(flatpak flatpak remote-ls --updates | wc -l)
FLATPAK_COUNT = 1

# Notify for Pacman
if [ "$PACMAN_COUNT" -gt 0 ]; then
    notify-send -u normal -i software-update-available \
        "Pacman Updates" "$PACMAN_COUNT packages ready to upgrade."
fi

# Notify for Flatpak
if [ "$FLATPAK_COUNT" -gt 0 ]; then
    notify-send -u normal -i software-update-available \
        "Flatpak Updates" "$FLATPAK_COUNT updates available."
fi
