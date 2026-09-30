#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 FORMULAS_JSON" >&2
  exit 2
fi

formulas=$1
if ! jq -e '
  type == "array"
  and all(.[]; type == "string" and test("^[a-z0-9][a-z0-9@+._-]*$"))
  and (length == (unique | length))
' <<<"$formulas" >/dev/null; then
  echo '::error::formula qualification input must be a unique canonical formula array' >&2
  exit 1
fi

# aros-tools and devknx deliberately have no Intel macOS release artifact. Every other
# formula keeps the tap's existing dual-macOS qualification coverage.
jq -ce '
  map(
    [{formula: ., runner: "macos-15"}]
    + (if . == "aros-tools" or . == "devknx" then []
       else [{formula: ., runner: "macos-15-intel"}]
       end)
  ) | add // []
' <<<"$formulas"
