#!/data/data/com.termux/files/usr/bin/bash

DE_LIST=("minimal" "xfce4" "lxde" "lxqt" "mate")
DE_CMDS=("none" "startxfce4" "startlxde" "startlxqt" "mate-session")
DE_NAMES=("Minimal" "XFCE4" "LXDE" "LXQt" "MATE")
INSTALLED=()
DEFAULT_DE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      echo "Usage: ./arch.sh [options]"
      echo ""
      echo "Options:"
      echo "  -h, --help           Show this help message and exit"
      echo "  -d N, --default N    Set default desktop environment (N):"
      echo "                       1 = XFCE4"
      echo "                       2 = LXDE"
      echo "                       3 = LXQt"
      echo "                       4 = MATE"
      echo "                       0 = Minimal (no desktop)"
      echo ""
      echo "Examples:"
      echo "  ./arch.sh -d 1     # Launch with XFCE4 as default"
      echo "  ./arch.sh -h       # Show this help message"
      exit 0
      ;;
    -d|--default)
      if [[ -n "$2" && "$2" =~ ^[0-4]$ ]]; then
        DEFAULT_DE=$2
        shift
        for i in "${!DE_LIST[@]}"; do
          if [[ "${DE_LIST[$i]}" == "minimal" ]]; then
            INSTALLED[$i]="(installed)"
          elif proot-distro login archlinux --shared-tmp -- /bin/bash -c "command -v ${DE_CMDS[$i]} >/dev/null 2>&1"; then
            INSTALLED[$i]="(installed)"
          else
            INSTALLED[$i]=""
          fi
        done
        choice_idx=$DEFAULT_DE
        if [[ "${INSTALLED[$choice_idx]}" != "(installed)" ]]; then
          echo "Desktop environment not installed."
          echo "Read manual/manual.md in the repository to install other desktop environments."
          exit 1
        fi
        kill -9 $(pgrep -f "termux.x11") 2>/dev/null
        pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
        export XDG_RUNTIME_DIR=${TMPDIR}
        termux-x11 :0 >/dev/null &
        sleep 3
        am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
        sleep 1
        case "$choice_idx" in
          0)
            echo "Launching minimal shell..."
            proot-distro login archlinux --shared-tmp -- /bin/bash
            ;;
          1)
            proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 startxfce4"'
            ;;
          2)
            proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 startlxde"'
            ;;
          3)
            proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 startlxqt"'
            ;;
          4)
            proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 mate-session"'
            ;;
          *)
            echo "Invalid selection."
            exit 1
            ;;
        esac
        exit 0
      else
        echo "Error: -d/--default requires a number 0-4."
        exit 1
      fi
      ;;
    *)
      ;;
  esac
  shift
done

for i in "${!DE_LIST[@]}"; do
  if [[ "${DE_LIST[$i]}" == "minimal" ]]; then
    INSTALLED[$i]="(installed)"
  elif proot-distro login archlinux --shared-tmp -- /bin/bash -c "command -v ${DE_CMDS[$i]} >/dev/null 2>&1"; then
    INSTALLED[$i]="(installed)"
  else
    INSTALLED[$i]=""
  fi
  if [[ $i -ne 0 && "${INSTALLED[$i]}" == "(installed)" && $DEFAULT_DE -eq 0 ]]; then
    DEFAULT_DE=$i
  fi
done

echo "Select your desktop environment to launch:"
for i in "${!DE_LIST[@]}"; do
  echo "$((i+1))) ${DE_NAMES[$i]} ${INSTALLED[$i]}"
done
echo "(Default: ${DE_NAMES[$DEFAULT_DE]})"
read -p "Enter your choice [1/2/3/4/5]: " de_choice
if [[ -z "$de_choice" ]]; then
  de_choice=$((DEFAULT_DE+1))
fi
choice_idx=$((de_choice-1))
if [[ "${INSTALLED[$choice_idx]}" != "(installed)" ]]; then
  echo "Desktop environment not installed."
  echo "Read manual/manual.md in the repository to install other desktop environments."
  exit 1
fi

kill -9 $(pgrep -f "termux.x11") 2>/dev/null
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &
sleep 3
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

case "$choice_idx" in
  0)
    echo "Launching minimal shell..."
    proot-distro login archlinux --shared-tmp -- /bin/bash
    ;;
  1)
    proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 startxfce4"'
    ;;
  2)
    proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 startlxde"'
    ;;
  3)
    proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 startlxqt"'
    ;;
  4)
    proot-distro login archlinux --shared-tmp -- /bin/bash -c 'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && su - user -c "env DISPLAY=:0 mate-session"'
    ;;
  *)
    echo "Invalid selection."
    exit 1
    ;;
esac

exit 0
