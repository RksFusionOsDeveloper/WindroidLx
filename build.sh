#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo: sudo ./build.sh" >&2
  exit 1
fi
for c in lb debootstrap xorriso mksquashfs; do
  command -v "$c" >/dev/null || { echo "Missing build tool: $c" >&2; exit 1; }
done
lb clean --purge || true
lb config \
  --mode debian \
  --distribution trixie \
  --architectures amd64 \
  --binary-images iso-hybrid \
  --archive-areas "main contrib non-free-firmware" \
  --debian-installer false \
  --bootappend-live "boot=live components quiet splash" \
  --iso-application "Fusion OS Prototype" \
  --iso-volume "FUSION_OS"
lb build
echo
echo "Build complete. ISO files:"
find . -maxdepth 1 -type f -iname '*.iso' -printf '%p (%s bytes)\\n'
