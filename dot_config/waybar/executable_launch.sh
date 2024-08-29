#!/bin/bash

PIDS="$(pidof waybar)"
if [ -n "${PIDS}" ]; then
	kill -9 ${PIDS}
	sleep 0.2
done

waybar -c config.jsonc -s style.css &
