dwm - dynamic window manager
============================
dwm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build dwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

Status is provided by the separate [dwmstatus](https://github.com/kafudz/dwmstatus)
panel. It draws its own X windows over dwm's bar, handles its own clicks and
needs no dwm patch. Start it from your `.xinitrc` alongside dwm; it finds the
bar when dwm maps it:

    dwmstatus &
    exec dwm

(`start_bg dwmstatus dwmstatus` works too if your `.xinitrc` tracks background
processes.) The panel writes a single space to the root window name so dwm does
not show its `dwm-x.y` banner next to the panel. See the dwmstatus README for
its click actions and GTK popup dependencies.


Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.


# dwm

My personal fork of [dwm](https://dwm.suckless.org/), the dynamic window manager for X11.

Based on suckless dwm and kept for **my own use**.  
Everything not listed below is upstream code; the notes here are mine.

## Personal use

This repo is for **my own setup**.  
It is not a general-purpose project, and I don’t guarantee it will work on your machine.  
Feel free to read/copy it, but expect to edit `config.h` for your own system.

## What’s included

- **i3-style containers** (default layout `i3`): manual splits plus tabbed/stacked
  containers. Tags only filter visibility, so splits survive tag switches. Tab
  titles of the focused tabbed/stacked container are shown in the bar. The i3
  directional/container functions remain available for custom bindings, but are
  no longer bound by default. The old layouts (`tile`, floating, monocle) remain
  on `Mod+t`, `Mod+f`, `Mod+m`; `Mod+Shift+t` returns to `i3`.

- **Systray support** (with spacing and icon size options)
- **Xft font rendering** — uses `VictorMono Nerd Font` by default
- **Media keys** for volume (via `pactl`) and screen brightness (via `brightnessctl`)
- **Refresh rate patch** for smoother window move/resize
- **Config refresh** — `Mod+r` re-execs dwm (after `make`) to load a rebuilt `config.h`
- **dmenu desktop launcher** (`dmenu_apps`) and a `sysmenu` binding
- **Screenshot keybindings** using scripts in `$HOME/bin/`
- **dwmstatus panel** — a standalone status panel (clock, volume, power) that
  draws over dwm's bar and no longer needs a dwm patch
- Personal color scheme and tag layout

See `config.h` for all keybindings, rules, and appearance settings.
