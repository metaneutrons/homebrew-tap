#!/usr/bin/env bash
set -euo pipefail

[[ $# -eq 0 ]] || { echo 'expected no arguments' >&2; exit 2; }
prefix=$(brew --prefix)
[[ "$prefix" == /* && "$prefix" != / ]] || {
  echo "invalid Homebrew prefix: $prefix" >&2
  exit 1
}

link="$prefix/bin/openssl"
legacy="$prefix/opt/openssl@1.1/bin/openssl"

# Hosted macOS images can retain this orphaned link. Homebrew's own unlink
# removes zero links in that state. Never touch another OpenSSL installation.
if [[ -L "$link" && $(readlink "$link") == "$legacy" ]]; then
  unlink "$link"
  if [[ -e "$link" || -L "$link" ]]; then
    echo "legacy OpenSSL link remains after unlink: $link" >&2
    exit 1
  fi
fi
