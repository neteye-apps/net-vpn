#!/bin/sh
set -e

# Bersihkan interface wg0 jika masih ada
if ip link show wg0 > /dev/null 2>&1; then
  echo "[INFO] Deleting leftover interface wg0"
  ip link delete wg0
fi

# Bersihkan route yg bentrok
if ip route | grep -q "10.10.10.0/24"; then
  echo "[INFO] Deleting leftover route 10.10.10.0/24"
  ip route delete 10.10.10.0/24
fi

# Lanjutkan ke entrypoint asli
exec /entrypoint.sh "$@"
