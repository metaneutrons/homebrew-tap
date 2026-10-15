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

# Only these formulas ship Linux artifacts. Each is qualified on x86_64 and on aarch64.
jq -ce '
  map(select(. == "aros-tools" or . == "morphos-cross"))
  | map(. as $formula | ["ubuntu-24.04", "ubuntu-24.04-arm"] | map({formula: $formula, runner: .}))
  | add // []
' <<<"$formulas"
