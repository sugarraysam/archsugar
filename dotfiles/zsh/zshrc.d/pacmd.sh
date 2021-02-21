#!/bin/bash

# Default sink will be one of:
#   alsa_output.pci-0000_00_1b.0.analog-stereo
#   alsa_output.pci-0000_00_03.0.hdmi-stereo

function _pacmdSet() {
    sink="${1}"
    case "${sink}" in
    "hdmi")
        new="$(pacmd list-sinks | grep -e 'alsa_output.*hdmi-stereo' -o)"
        ;;
    "analog")
        new="$(pacmd list-sinks | grep -e 'alsa_output.*analog-stereo' -o)"
        ;;
    esac
    if [ -z "${new}" ]; then
        echo >&2 "Could not find a sink for ${sink}..."
    else
        pacmd "set-default-sink ${new}"
    fi
}

# set analog sink
alias pacmdAnalog="_pacmdSet analog"

# set hdmi sink
alias pacmdHDMI="_pacmdSet hdmi"

# get sinks
alias pacmdListSinks="pacmd list-sinks | grep -e 'name:'"
