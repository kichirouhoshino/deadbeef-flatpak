# Personal DeaDBeeF Flatpak package

You can install it from my personal flatpak repo (remove the --user argument to install system-wide)
``` bash
flatpak remote-add --user roddy-flatpak https://kichirouhoshino.github.io/roddy-flatpaks/index.flatpakrepo
flatpak install roddy-flatpak music.deadbeef.player
```
Issues:
- The runtime currently used is org.gnome.Platform//46 as DeaDBeeF 1.9.6 requires an older version of ffmpeg.
- The flatpak isn't entirely sandboxed. It has full access to the Music folder and the ~/.local/lib64/deadbeef folder for plugins.
- libopus requires internet during build time, which is discouraged according to Flathub guidelines
