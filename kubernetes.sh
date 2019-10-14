#!/usr/bin/env bash
source <(kubectl completion bash)
alias kc=kubectl
complete -F __start_kubectl kc
alias kd='export KUBECONFIG=""'
alias kk='export KUBECONFIG=$(kind get kubeconfig-path --name="kind")'
