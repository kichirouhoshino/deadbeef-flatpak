# Personal DeaDBeeF Flatpak package

My fork of saivert's DeaDBeeF Flatpak packaging

Combined changes:
- Build with GTKNativeFileChooser
- Replace built-in pulseaudio with saivert's improved pulseaudio output plugin
- Remove default pulseaudio plugin and alsa plugin
- Add gtkmm3 to allow some plugins to work
- Can recursively scan for plugins in the `/app/extensions` directory

You can install it from my personal flatpak repo (remove the --user argument to install system-wide)
``` bash
flatpak remote-add --user roddy-flatpak https://kichirouhoshino.github.io/roddy-flatpaks/index.flatpakrepo
flatpak install roddy-flatpak music.deadbeef.player
```

You can then run `flatpak search music.deadbeef.player` to look for flatpak extensions.

Flatpak extensions load their files to `/app/extensions`, with each extension having its own folder. Plugins are built along with the main application and are exported as extensions.

You can make your own extension, or put your plugins at `~/.local/lib/deadbeef` or `~/.local/lib64/deadbeef` as always.

Below is the original contents of the README.

# deadbeef-flatpak

DeaDBeeF stable build 1.8.1 support building with GTKNativeFileChooser which is utilized to support flatpak portals. Other than that the xdg-music (~/Music) folder is made available by default so it is not fully sandboxed.

The master build manifest (music.deadbeef.player-master.json) builds DeaDBeeF with support for GtkFileChooserNative which gives portal access to single files. 

Portals does now support opening folders, but there is still no logic to automatically request both files in a cue/mp3 set (or similar). Opening a folder containing such a set does work but is counterintuitive. xdg-desktop-portals project is looking into this. Follow this [issue](https://github.com/flatpak/xdg-desktop-portal/issues/463) for more updates.

This flatpak is not using `--socket=fallback-x11` in order for hotkeys plugin to work properly. Thus X11 is always available even on Wayland. It needs to be patched to check if X11 is available at runtime. It uses raw Xlib calls to implement global hotkeys which isn't working on Wayland anyways.

You can allow full filesystem and network share access by using overrides like so:

    $ flatpak --user override --filesystem=host --filesystem=xdg-run/gvfs music.deadbeef.player

This flatpak uses my improved pulseaudio output plugin and does not include the one included with DeaDBeeF by default, nor does it include ALSA.
