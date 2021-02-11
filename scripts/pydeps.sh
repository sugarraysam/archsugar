#!/bin/bash

set -e

if [ "${CI}" == "true" ]; then
    export PIP3=pip3
else
    export PIP3=".venv/bin/pip3"
fi

if [ ! "${CI}" == "true" ] && [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi

${PIP3} install -U pip
${PIP3} install -r requirements.txt
