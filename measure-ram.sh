#!/usr/bin/env bash
set -euo pipefail
echo "=== Fusion OS memory snapshot ==="
date
free -h
echo
echo "Top resident processes (RSS):"
ps -eo pid,comm,rss --sort=-rss | head -n 16
echo
echo "Memory pressure:"
if [[ -r /proc/pressure/memory ]]; then cat /proc/pressure/memory; else echo "PSI unavailable"; fi
echo
echo "Save this output before and after launching Waydroid/Wine to compare."
