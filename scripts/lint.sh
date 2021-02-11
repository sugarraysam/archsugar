#!/bin/bash

set -e

if [ "${CI}" == "true" ]; then
    export YAMLLINT=yamllint
    export ANSIBLE_LINT=ansible-lint
else
    export YAMLLINT=".venv/bin/yamllint"
    export ANSIBLE_LINT=".venv/bin/ansible-lint"
fi

if ! ${YAMLLINT} --version >/dev/null 2>&1; then
    echo "Missing python dependencies, please run '$ make pydeps'"
    exit 1
fi

${YAMLLINT} -c .linters/yamllint.yml .
${ANSIBLE_LINT} -c .linters/ansible-lint.yml .
