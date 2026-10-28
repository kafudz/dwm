/* Minimal Xft.h STUB -- only for syntax-checking dwm.c where libXft is not
 * installed. It does NOT provide drawing or font functions, so it cannot be
 * used to build a working dwm. For a real build, install the real headers
 * (see below) and do not use this file.
 *
 *   Debian/Ubuntu: sudo apt install libxft-dev libx11-dev libxinerama-dev
 *   Arch:          sudo pacman -S libxft libx11 libxinerama
 *   Fedora:        sudo dnf install libXft-devel libX11-devel libXinerama-devel
 *
 * Usage for a syntax check only:
 *   mkdir -p stub/X11/Xft && cp Xft.h stub/X11/Xft/
 *   gcc -fsyntax-only -Wall -DVERSION=\"6.5\" -Istub dwm.c
 */
#ifndef XFT_STUB_H
#define XFT_STUB_H

#include <X11/Xlib.h>

typedef struct { int height, ascent, descent; } XftFont;
typedef struct _FcPattern FcPattern;
typedef struct { unsigned long pixel; } XftColor;

#endif /* XFT_STUB_H */
