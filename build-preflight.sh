#!/usr/bin/env bash
set -euo pipefail
echo "Fusion OS build-host preflight"
echo "Host: $(. /etc/os-release; echo "${PRETTY_NAME:-unknown}")"
echo "Architecture: $(dpkg --print-architecture 2>/dev/null || uname -m)"
echo
missing=0
for c in lb debootstrap xorriso mksquashfs; do
  if command -v "$c" >/dev/null 2>&1; then
    printf 'OK      %s: %s\\n' "$c" "$(command -v "$c")"
  else
    printf 'MISSING %s\\n' "$c"
    missing=1
  fi
done
echo
df -h .
if [[ "$missing" -ne 0 ]]; then
  echo
  echo "Install the missing build tools on a Debian 13 amd64 build host:"
  echo "  sudo apt update"
  echo "  sudo apt install live-build debootstrap xorriso squashfs-tools"
  exit 1
fi
echo
echo "Preflight passed. Run: sudo ./build.sh"
