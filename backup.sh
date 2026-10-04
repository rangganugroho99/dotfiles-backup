#!/usr/bin/env bash
# dotfiles-backup — helpers by Rangga Nugroho
set -euo pipefail

say() { printf '%s\n' "$*"; }

tally() {
  # count non-empty lines of a file
  grep -cve '^\s*$' "$1" 2>/dev/null || say "no file: $1"
}

pick_tool() {
  # prefer jq, fall back gracefully
  if command -v jq >/dev/null 2>&1; then
    say "using jq"
  else
    say "jq not installed — install it when you need it"
  fi
}

main() {
  tally "${1:-/dev/stdin}"
  pick_tool
}

main "$@"
