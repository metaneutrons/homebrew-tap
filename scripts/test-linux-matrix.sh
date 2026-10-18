#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd -P)
planner="$root/scripts/plan-linux-matrix.sh"

assert_matrix() {
  local input=$1 expected=$2 actual
  actual=$("$planner" "$input")
  if [[ "$actual" != "$expected" ]]; then
    echo "expected: $expected" >&2
    echo "actual:   $actual" >&2
    exit 1
  fi
}

assert_matrix '[]' '[]'
assert_matrix '["bups"]' '[]'
assert_matrix '["ami-rust"]' '[]'
assert_matrix '["aros-tools"]' \
  '[{"formula":"aros-tools","runner":"ubuntu-24.04"},{"formula":"aros-tools","runner":"ubuntu-24.04-arm"}]'
assert_matrix '["morphos-cross"]' \
  '[{"formula":"morphos-cross","runner":"ubuntu-24.04"},{"formula":"morphos-cross","runner":"ubuntu-24.04-arm"}]'
assert_matrix '["aros-tools","bups","morphos-cross"]' \
  '[{"formula":"aros-tools","runner":"ubuntu-24.04"},{"formula":"aros-tools","runner":"ubuntu-24.04-arm"},{"formula":"morphos-cross","runner":"ubuntu-24.04"},{"formula":"morphos-cross","runner":"ubuntu-24.04-arm"}]'

for invalid in 'null' '["aros-tools","aros-tools"]' '["AROS-tools"]'; do
  if "$planner" "$invalid" >/dev/null 2>&1; then
    echo "planner accepted invalid input: $invalid" >&2
    exit 1
  fi
done
