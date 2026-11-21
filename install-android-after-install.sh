#!/usr/bin/env bash
# Run on the INSTALLED Fusion OS, not from the live USB session.
set -euo pipefail
if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo: sudo $0" >&2; exit 1
fi
. /etc/os-release
if [[ "${ID:-}" != "debian" || "${VERSION_CODENAME:-}" != "trixie" ]]; then
  echo "This helper targets Debian 13 (trixie)." >&2; exit 1
fi
install -d /etc/apt/sources.list.d
cat > /etc/apt/sources.list.d/trixie-backports.list <<'EOF'
deb http://deb.debian.org/debian trixie-backports main contrib non-free-firmware
EOF
apt-get update
apt-get install -y -t trixie-backports waydroid
cat <<'EOF'
Waydroid installed. Initialize and start it only after confirming kernel binder support:
  sudo waydroid init
  sudo systemctl enable --now waydroid-container
  waydroid show-full-ui
Google Play is NOT included. A GAPPS-enabled image and Google device certification may be required;
Play Store availability is not guaranteed. Do not download unofficial modified images.
EOF
