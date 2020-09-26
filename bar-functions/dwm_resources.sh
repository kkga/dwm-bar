#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    CPU=$(sensors | grep Tdie | cut -c 16-17)
    GPU=$(sensors | grep edge | cut -c 16-17)
    GPU_FAN=$(sensors | grep fan1 | awk '{print $2}')

    printf "%s" "$SEP1"
    printf "Tc %s° Tg %s° Fg %s" "$CPU" "$GPU" "$GPU_FAN"
    printf "%s\n" "$SEP2"
}

dwm_resources
