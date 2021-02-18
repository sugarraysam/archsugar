#!/bin/bash

# Default sink will be one of:
#   alsa_output.pci-0000_00_1b.0.analog-stereo
#   alsa_output.pci-0000_00_03.0.hdmi-stereo

function _pacmdToggle() {
    old="$(pacmd dump | grep default-sink | cut -d' ' -f 2)"
    if [[ "${old}" =~ "hdmi-stereo" ]]; then
        # set analog-stereo
        new="$(pacmd list-sinks | grep -e 'alsa_output.*analog-stereo' -o)"
    else
        # set hdmi-stereo
        new="$(pacmd list-sinks | grep -e 'alsa_output.*hdmi-stereo' -o)"
    fi
    echo "Old sink: ${old}, New sink: ${new}"
    pacmd "set-default-sink ${new}"
}

# toggle sound output sink
alias pacmdToggle="_pacmdToggle"
