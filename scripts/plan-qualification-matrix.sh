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

# ami-rust is qualified only on macOS 26 Apple Silicon. aros-tools, devknx and morphos-cross
# deliberately have no Intel macOS release artifact. Every other formula keeps the tap's
# existing macOS qualification coverage.
jq -ce '
  map(
    if . == "ami-rust" then [{formula: ., runner: "macos-26"}]
    else
      [{formula: ., runner: "macos-15"}]
      + (if . == "aros-tools" or . == "devknx" or . == "morphos-cross" then []
         else [{formula: ., runner: "macos-15-intel"}]
         end)
    end
  ) | add // []
' <<<"$formulas"
