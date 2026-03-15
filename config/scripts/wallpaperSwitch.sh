#!/bin/bash

DIR="$HOME/wallpaper/stash/wallhaven"
STATE="$HOME/.cache/next_wallpaper_index"

[ -f "$STATE" ] || echo 0 > "$STATE"
i=$(cat "$STATE")

mapfile -t files < <(find "$DIR" -maxdepth 1 -type f | sort)
[ "${#files[@]}" -eq 0 ] && exit 1

[ "$i" -ge "${#files[@]}" ] && i=0
img="${files[$i]}"

echo $((i + 1)) > "$STATE"

pkill swaybg 2>/dev/null
setsid swaybg -i "$img" -m fill >/dev/null 2>&1 &
