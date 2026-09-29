#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd -P)
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
mkdir -p "$work/mock-bin" "$work/prefix/bin"
prefix="$work/prefix"
legacy="$prefix/opt/openssl@1.1/bin/openssl"
link="$prefix/bin/openssl"

# The mock must expand TEST_BREW_PREFIX when invoked, not when created.
# shellcheck disable=SC2016
printf '#!/usr/bin/env bash\nprintf "%%s\\n" "$TEST_BREW_PREFIX"\n' > "$work/mock-bin/brew"
chmod +x "$work/mock-bin/brew"
export TEST_BREW_PREFIX="$prefix"
export PATH="$work/mock-bin:$PATH"

ln -s "$legacy" "$link"
bash "$root/scripts/prepare-aros-tools-openssl.sh"
[[ ! -e "$link" && ! -L "$link" ]] || { echo 'legacy link was not removed' >&2; exit 1; }

ln -s "$prefix/opt/openssl@3/bin/openssl" "$link"
bash "$root/scripts/prepare-aros-tools-openssl.sh"
[[ $(readlink "$link") == "$prefix/opt/openssl@3/bin/openssl" ]] || {
  echo 'current OpenSSL link was changed' >&2
  exit 1
}
unlink "$link"

printf 'preserve me\n' > "$link"
bash "$root/scripts/prepare-aros-tools-openssl.sh"
[[ $(< "$link") == 'preserve me' ]] || { echo 'regular file was changed' >&2; exit 1; }
unlink "$link"

ln -s "$legacy" "$link"
printf '#!/usr/bin/env bash\nexit 1\n' > "$work/mock-bin/unlink"
chmod +x "$work/mock-bin/unlink"
if bash "$root/scripts/prepare-aros-tools-openssl.sh" >/dev/null 2>&1; then
  echo 'failed unlink was accepted' >&2
  exit 1
fi
[[ -L "$link" ]] || { echo 'failed unlink modified the link' >&2; exit 1; }

export TEST_BREW_PREFIX=/
if bash "$root/scripts/prepare-aros-tools-openssl.sh" >/dev/null 2>&1; then
  echo 'root Homebrew prefix was accepted' >&2
  exit 1
fi

echo 'aros-tools macOS OpenSSL qualification guard passed'
