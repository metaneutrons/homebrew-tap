#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd -P)
planner="$root/scripts/plan-qualification-matrix.sh"

assert_matrix() {
  local input=$1 expected=$2 actual
  actual=$("$planner" "$input")
  if [[ "$actual" != "$expected" ]]; then
    echo "expected: $expected" >&2
    echo "actual:   $actual" >&2
    exit 1
  fi
}

assert_matrix '["aros-tools"]' \
  '[{"formula":"aros-tools","runner":"macos-15"}]'
assert_matrix '[]' '[]'
assert_matrix '["bups"]' \
  '[{"formula":"bups","runner":"macos-15"},{"formula":"bups","runner":"macos-15-intel"}]'
assert_matrix '["aros-tools","bups"]' \
  '[{"formula":"aros-tools","runner":"macos-15"},{"formula":"bups","runner":"macos-15"},{"formula":"bups","runner":"macos-15-intel"}]'

for invalid in 'null' '["aros-tools","aros-tools"]' '["AROS-tools"]'; do
  if "$planner" "$invalid" >/dev/null 2>&1; then
    echo "planner accepted invalid input: $invalid" >&2
    exit 1
  fi
done
