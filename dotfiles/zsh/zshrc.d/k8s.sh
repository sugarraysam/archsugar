#!/bin/bash

export KUBE="${HOME}/.kube"
export KUBECONFIG="${KUBE}/cov:${KUBE}/config"

# shortcut for kubectl + fix completions
alias k="kubectl"
complete -F __start_kubectl k

# set default namespace
function _setns() {
    kubectl config set-context --current --namespace="${1}"
}
alias ksetns="_setns"

# print contexts
alias kst="kubectl config get-contexts"

# use another context
alias kuse="kubectl config use-context"

function _helmDiffValues() {
    if (($# != 3)); then
        echo >&2 "${0} usage: chart oldVersion newVersion"
        return 1
    fi
    chart="${1}"
    old="${2}"
    new="${3}"
    diff --color=always <(helm show chart --version ${old} ${chart}) <(helm show chart --version ${new} ${chart})
}

# diff helm chart values between versions
alias helmDiffValues="_helmDiffValues"
