#!/bin/bash
# Build DeaDBeeF Flatpak using the Flatpak version of flatpak-builder
# This is useful when the host environment is different or limited (e.g. inside a container).

echo "Starting build process..."
flatpak run org.flatpak.Builder --user --install --force-clean build-dir music.deadbeef.player.json

if [ $? -eq 0 ]; then
    echo "Build and installation successful."
else
    echo "Build failed."
    exit 1
fi
