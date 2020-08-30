#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    CPU=$(sensors | grep Tdie | cut -c 16-21)
    GPU=$(sensors | grep edge | cut -c 16-21)
    GPU_FAN=$(sensors | grep fan1 | awk '{print $2}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "💻 MEM %s/%s CPU %s STO %s/%s: %s" "$MEMUSED" "$MEMTOT" "$CPU" "$STOUSED" "$STOTOT" "$STOPER"
    else
        printf "cpu: %s gpu: %s rpm: %s" "$CPU" "$GPU" "$GPU_FAN"
    fi
    printf "%s\n" "$SEP2"
}

dwm_resources
