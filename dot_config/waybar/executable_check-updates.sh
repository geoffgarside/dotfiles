#/bin/sh

# checkupdates from pacman-contrib package
sys_pkgs=$(checkupdates 2>/dev/null | wc -l)
aur_pkgs=$(yay -Qu --aur --quiet | wc -l)

if [ "${sys_pkgs}" -eq "0" ] && [ "${aur_pkgs}" -eq "0" ]; then
	printf '{"text": "", "alt": "uptodate", "tooltip": "", "class": ""}'
	printf "\n"
	exit 0
fi

# else we have updates

printf '{"text": "%s+%s", "alt": "updates", "tooltip": "arch: %s\raur: %s", "class": ""}' "${sys_pkgs}" "${aur_pkgs}" "${sys_pkgs}" "${aur_pkgs}"
printf "\n"
exit 0
