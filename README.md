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

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm


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
  containers, directional focus/move/resize. Tags only filter visibility, so
  splits survive tag switches. Tab titles of the focused tabbed/stacked container
  are shown in the bar. The old layouts (`tile`, floating, monocle) remain on
  `Mod+t`, `Mod+f`, `Mod+m`; `Mod+Shift+t` returns to `i3`.

  | Keys | Action |
  |------|--------|
  | `Mod+Arrows` | focus left/right/up/down (tree-aware, switches tabs) |
  | `Mod+Shift+Arrows` | move window in that direction (enters/leaves containers) |
  | `Mod+Ctrl+Arrows` | grow/shrink focused container |
  | `Mod+Shift+h` / `Mod+Shift+v` | next window opens split horizontally / vertically (`>h`/`>v` in the layout symbol) |
  | `Mod+e` | toggle split orientation of the focused container |
  | `Mod+w` / `Mod+s` / `Mod+Shift+s` | tabbed / stacked / back to horizontal split |

- **Systray support** (with spacing and icon size options)
- **Xft font rendering** — uses `VictorMono Nerd Font` by default
- **Media keys** for volume (via `pactl`) and screen brightness (via `brightnessctl`)
- **Refresh rate patch** for smoother window move/resize
- **dmenu desktop launcher** (`dmenu_apps`) and a `sysmenu` binding
- **Screenshot keybindings** using scripts in `$HOME/bin/`
- Personal color scheme and tag layout

See `config.h` for all keybindings, rules, and appearance settings.
