#!/bin/bash

DIR="$(dirname "${BASH_SOURCE[@]}")"
PIDS="$(pidof waybar)"
if [ -n "${PIDS}" ]; then
	kill -9 ${PIDS}
	sleep 0.2
fi

waybar -c "${DIR}/config.jsonc" \
	-s "${DIR}/style.css" \
	-l error &
