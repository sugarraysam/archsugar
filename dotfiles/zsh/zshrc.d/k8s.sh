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
