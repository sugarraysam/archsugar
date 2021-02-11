#!/bin/bash

# setup autocompletion
source <(kubectl completion zsh)

# shortcut for kubectl
alias k="kubectl"
complete -F __start_kubectl k
