#!/usr/bin/env bash

set -euo pipefail

readonly OUTPUT_PATH="${1:-README.md}"
readonly FORMULA_DIR="${FORMULA_DIR:-Formula}"

fail() {
  local code="$1"
  shift
  printf 'homebrew-tap-readme[%s]: %s\n' "$code" "$*" >&2
  exit 1
}

extract_string() {
  local key="$1"
  local formula_file="$2"
  sed -nE "s/^[[:space:]]*${key} \"([^\"]+)\".*/\\1/p" "$formula_file" | head -n 1
}

resolve_version() {
  local formula_file="$1"
  local version

  version="$(extract_string version "$formula_file")"
  if [[ -z "$version" ]]; then
    version="$(sed -nE 's/^[[:space:]]*url "([^"]+)".*/\1/p' "$formula_file" \
      | grep -Eo '[0-9]+(\.[0-9]+)+' \
      | head -n 1 || true)"
  fi
  [[ -n "$version" ]] || fail HRD1004 "cannot derive a version from $formula_file"
  printf '%s' "$version"
}

[[ -d "$FORMULA_DIR" ]] || fail HRD1001 "formula directory does not exist: $FORMULA_DIR"
formula_files=()
while IFS= read -r formula_file; do
  formula_files+=("$formula_file")
done < <(find "$FORMULA_DIR" -maxdepth 1 -type f -name '*.rb' -print | LC_ALL=C sort)
(( ${#formula_files[@]} > 0 )) || fail HRD1002 "no formulas found in $FORMULA_DIR"

output_dir="$(dirname "$OUTPUT_PATH")"
[[ -d "$output_dir" ]] || fail HRD1003 "output directory does not exist: $output_dir"

temp_file="$(mktemp "$output_dir/.README.md.XXXXXX")"
trap 'rm -f "$temp_file"' EXIT

cat > "$temp_file" <<'EOF'
# 🍺 Homebrew Tap - metaneutrons

Custom Homebrew formulas for metaneutrons projects.

## 📦 Installation

First, tap this repository:

```bash
brew tap metaneutrons/tap
```

## 🚀 Available Formulas
EOF

for formula_file in "${formula_files[@]}"; do
  formula_name="$(basename "$formula_file" .rb)"
  description="$(extract_string desc "$formula_file")"
  homepage="$(extract_string homepage "$formula_file")"
  version="$(resolve_version "$formula_file")"

  [[ -n "$description" ]] || fail HRD1005 "missing description in $formula_file"
  [[ -n "$homepage" ]] || fail HRD1006 "missing homepage in $formula_file"

  cat >> "$temp_file" <<EOF

### $formula_name

**Description:** $description

**Version:** $version

**Homepage:** $homepage

**Installation:**

\`\`\`bash
brew install metaneutrons/tap/$formula_name
\`\`\`
EOF
done

cat >> "$temp_file" <<'EOF'

## 💻 Usage

After installation, you can use any of the tools directly from your terminal.

## 🐛 Issues

If you encounter any issues with these formulas, please report them in the respective project repositories.

## 🤝 Contributing

Formula changes and the generated README must be submitted together in one pull request. Run `scripts/generate-readme.sh` after changing a formula.
EOF

chmod 0644 "$temp_file"
mv "$temp_file" "$OUTPUT_PATH"
trap - EXIT
