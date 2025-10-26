#!/usr/bin/env bash
#Hacky way to add packages from AUR until we can build them from Sandbox
# Note all the packages have been cloned directly from AUR and only google-chrome and
# spotify are modifed to move their data to /usr/share instead of their default /opt

#If you have large packages arch's default user quotas might make your build fail
# you can temporary disable them by "sudo setquota -u $USER 0 0 0 0 /tmp"

set -euxo pipefail
# Define project and output directories
PROJECT_DIR="$(realpath "$(dirname "$0")/..")"
PKGBUILDS_DIR="$PROJECT_DIR/pkgs"
PKGDEST="$PROJECT_DIR/mkosi.packages"

mkdir -p "$PKGDEST"


echo "==> Building packages into: $PKGDEST"
for pkg in "$PKGBUILDS_DIR"/*/PKGBUILD; do
  pkgdir="$(dirname "$pkg")"
  pkgname="$(basename "$pkgdir")"
  echo "==> Building $pkgname"
  pushd "$pkgdir" >/dev/null
  env PKGDEST="$PKGDEST" makepkg -sf --noconfirm
  popd >/dev/null
done
echo "==> All packages built successfully."
ls -lh "$PKGDEST"
