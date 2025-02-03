# Personal DeaDBeeF Flatpak package

My fork of saivert's DeaDBeeF Flatpak packaging

Combined changes:
- Builds with GTKNativeFileChooser
- Makes use of saivert's pulseaudio output plugin
- Removes default pulseaudio plugin and alsa plugin
- Can now recursively scan plugin directories

Flatpak extensions load their files to `/app/lib/deadbeef/flatpak`, with each extension having its own folder. Due to Flatpak limitations, you cannot add plugins directly to the `/app/lib/deadbeef` folder, which is why I patched DeaDBeeF to allow recursive plugin scanning. You can find the current available plugins in the `plugins` folder in this repo. All plugins are built from source whenever possible.

Below is the original contents of the README.

# deadbeef-flatpak

DeaDBeeF stable build 1.8.1 support building with GTKNativeFileChooser which is utilized to support flatpak portals. Other than that the xdg-music (~/Music) folder is made available by default so it is not fully sandboxed.

The master build manifest (music.deadbeef.player-master.json) builds DeaDBeeF with support for GtkFileChooserNative which gives portal access to single files. 

Portals does now support opening folders, but there is still no logic to automatically request both files in a cue/mp3 set (or similar). Opening a folder containing such a set does work but is counterintuitive. xdg-desktop-portals project is looking into this. Follow this [issue](https://github.com/flatpak/xdg-desktop-portal/issues/463) for more updates.

This flatpak is not using `--socket=fallback-x11` in order for hotkeys plugin to work properly. Thus X11 is always available even on Wayland. It needs to be patched to check if X11 is available at runtime. It uses raw Xlib calls to implement global hotkeys which isn't working on Wayland anyways.

You can allow full filesystem and network share access by using overrides like so:

    $ flatpak --user override --filesystem=host --filesystem=xdg-run/gvfs music.deadbeef.player

This flatpak uses my improved pulseaudio output plugin and does not include the one included with DeaDBeeF by default, nor does it include ALSA.
