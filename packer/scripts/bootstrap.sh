#!/bin/bash

set -x
set -e

ARCHSUGAR_URL="https://github.com/sugarraysam/archsugar-cli/releases/download/v${ARCHSUGAR_VERSION}/archsugar-cli_${ARCHSUGAR_VERSION}_linux_amd64.tar.gz"

# Make sure there will be enough space on the live ISO
function resizeRootfs() {
    if [ -d /run/archiso ]; then
        mount -o remount,size=2G /run/archiso/cowspace
    fi
}

function installPacmanDependencies() {
    pacman --noconfirm -q -Sy
    pacman --noconfirm -q -S git ansible
}

function installArchsugar() {
    curl -Lsk -o archsugar.tar.gz "${ARCHSUGAR_URL}"
    tar -xvzf archsugar.tar.gz \
        --exclude="*LICENSE*" \
        --exclude="*README*" \
        --strip-components 1 >/dev/null 2>&1
    chmod 755 archsugar
    cp archsugar /usr/local/bin/archsugar
    archsugar version >/dev/null 2>&1
    rm archsugar.tar.gz archsugar
}

# Execute
resizeRootfs
installPacmanDependencies
installArchsugar
archsugar bootstrap --disk /dev/sda --vagrant
#reboot # TODO fix this...
