#!/usr/bin/env sh

set -eu

echo "Running lightweight secret scan..."

patterns='(AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z\-_]{35}|-----BEGIN (RSA|EC|OPENSSH|DSA) PRIVATE KEY-----|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,48})'

if rg --hidden --glob '!.git' --glob '!build' --glob '!.dart_tool' -n "$patterns" .; then
  echo "Potential secret detected. Commit blocked."
  exit 1
fi

echo "Secret scan passed."
