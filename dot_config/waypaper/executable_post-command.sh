#!/bin/bash
# TODO: support multiple monitors with different wallpaper

CACHE_HOME="${XDG_CACHE_HOME-$HOME/.cache}"

wallpaper="${1}"
basepaper=$(basename "${wallpaper}")

generated="${CACHE_HOME}/waypaper/generated"

squared="${CACHE_HOME}/waypaper/squared.png"
blurred="${CACHE_HOME}/waypaper/blurred.png"
blur="50x30"

echo "${wallpaper}" > "${CACHE_HOME}/waypaper/current"

# run wallust to update terminal colours
wallust run -q "${wallpaper}"

# TODO: Update the ~/.config/hypr/hyprpaper.conf content
# so the right file is used before waypaper --restore
# is executed

# Create blurred wallpaper for hyprlock
generated_blurred="${generated}/blur-${blur}-${basepaper}"
if [ -f "${generated_blurred}" ] ; then
	cp "${generated_blurred}" "${blurred}"
else
	dunstify "Creating blurred version ..." "with image ${basepaper}" \
		-h int:value:50 -h string:x-dunst-stack-tag:wallpaper
	magick "$wallpaper" -resize 75% "$blurred"
	magick "$blurred" -blur "${blur}" "$blurred"
	cp "$blurred" "${generated_blurred}"
fi

generated_squared="${generated}/square-${basepaper}"
if [ -f "${generated_squared}" ] ; then
	cp "${generated_squared}" "${squared}"
else
	dunstify "Creating square version ..." "with image ${basepaper}" \
		-h int:value:75 -h string:x-dunst-stack-tag:wallpaper
	magick "${wallpaper}" -gravity Center -extent 1:1 "${squared}"
	cp "${squared}" "${generated_squared}"
fi
