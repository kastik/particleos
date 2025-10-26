#!/usr/bin/env bash
set -euxo pipefail

# Define project and output directories
PROJECT_DIR="$(realpath "$(dirname "$0")/..")"
PKGBUILDS_DIR="$PROJECT_DIR/pkgs"
PKGDEST="$PROJECT_DIR/mkosi.packages"
BUILDDIR="$PROJECT_DIR/.build"   # <── Persistent build dir (not in /tmp)
TMPDIR="$PROJECT_DIR/.tmp"       # <── Redirects all temp files

mkdir -p "$PKGDEST" "$BUILDDIR" "$TMPDIR"

echo "==> Building packages into: $PKGDEST"
echo "==> Using BUILDDIR: $BUILDDIR"
echo "==> Using TMPDIR: $TMPDIR"

for pkg in "$PKGBUILDS_DIR"/*/PKGBUILD; do
    pkgdir="$(dirname "$pkg")"
    pkgname="$(basename "$pkgdir")"
    echo "==> Building $pkgname"

    pushd "$pkgdir" >/dev/null

    env PKGDEST="$PKGDEST" BUILDDIR="$BUILDDIR" TMPDIR="$TMPDIR" makepkg -sf --noconfirm

    echo "==> Cleaning up build files for $pkgname"
    rm -rf src pkg *.tar.zst *.tar.xz *.tar.gz || true

    popd >/dev/null
done

echo "==> All packages built successfully."
ls -lh "$PKGDEST"

# Optional: remove build directories completely after all builds
rm -rf "$BUILDDIR" "$TMPDIR"
