#!/bin/bash
#
# Script will run either during live ISO bare metal install, or packer QEMU builder (KVM)

set -x
set -e

function checkIsRoot() {
    if [ "${EUID}" -ne 0 ]; then
        echo "Please run as root"
        exit 1
    fi
}

# Make sure there will be enough space on the live ISO
function resizeRootfs() {
    if [ -d /run/archiso ]; then
        mount -o remount,size=2G /run/archiso/cowspace
    fi
}

function installPacmanDependencies() {
    pacman --noconfirm -q -Sy
    pacman --noconfirm -q -S make git ansible go
}

function cloneArchsugarRepo() {
    if [ ! -d "${ARCHSUGAR_PATH}" ]; then
        git clone -b "${ARCHSUGAR_VERSION}" --depth 1 "${ARCHSUGAR_URL}" "${ARCHSUGAR_PATH}"
    fi
}

function buildAndInstall() {
    cd "${ARCHSUGAR_PATH}" && make install
}

# vars
ARCHSUGAR_URL=https://github.com/sugarraysam/archsugar
ARCHSUGAR_VERSION=dev
ARCHSUGAR_PATH="${HOME}/.archsugar"

# Execute
checkIsRoot
resizeRootfs
installPacmanDependencies
cloneArchsugarRepo
buildAndInstall
