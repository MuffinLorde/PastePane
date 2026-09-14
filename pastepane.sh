#!/bin/bash

clipboard=("PastePane")
current_clip=$(wl-paste)

mapfile -t clipboard < "pastepane.txt"

if [[ $(tail -n 1 pastepane.txt) != $current_clip ]]; then
	wl-paste >> pastepane.txt
fi

clipboard_reverse=()

for ((i=${#clipboard[@]}-1; i>=0; i--)); do
    clipboard_reverse+=("${clipboard[i]}")
done

choice=$(zenity --list --title="PastePane" --column="Clipboard" "${clipboard_reverse[@]}")
wl-copy $choice
