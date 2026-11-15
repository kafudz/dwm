#!/bin/sh
# lockscreen.sh - kunci layar dengan i3lock.
#
# Dipakai oleh:
#   - sysmenu (opsi "Lock")
#   - xss-lock (kunci otomatis saat sesi diminta lock / sistem mau tidur)
#
# Catatan i3lock 2.16:
#   - -d (DPMS) dan -I (inactivity timeout) sudah DIHAPUS sejak 2.8.
#   - -i hanya menerima PNG (JPEG tidak didukung).
#   - -n wajib: xss-lock menunggu proses locker, jadi i3lock tidak boleh fork.
#   - -u berarti "matikan indikator unlock", bukan "tampilkan user".

COLOR=121314
IMAGE="$HOME/.config/i3lock/background.png"

# Opsi dasar: warna gelap senada dmenu, pointer tetap terlihat,
# abaikan password kosong, tampilkan jumlah gagal & layout keyboard.
set -- -n -c "$COLOR" -p default -e -f -k

# Opsional: kalau ada PNG di lokasi ini, pakai sebagai latar (di-tile).
if [ -f "$IMAGE" ]; then
    set -- "$@" -i "$IMAGE" -t
fi

# Jangan menumpuk locker bila sudah terkunci.
if pkill -0 -u "$(id -u)" -x i3lock 2>/dev/null; then
    exit 0
fi

if [ -n "${XSS_SLEEP_LOCK_FD:-}" ] && [ -e "/dev/fd/${XSS_SLEEP_LOCK_FD}" ]; then
    # xss-lock menahan suspend sampai fd inhibitor ditutup. i3lock harus
    # tidak mewarisi fd itu, lalu kita tutup setelah jendela kunci siap.
    fd=$XSS_SLEEP_LOCK_FD
    trap 'pkill -u "$(id -u)" -x i3lock 2>/dev/null' TERM INT

    eval "i3lock \"\$@\" ${fd}<&-" &
    sleep 1
    eval "exec ${fd}<&-"

    wait
else
    exec i3lock "$@"
fi
