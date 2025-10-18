# Manual Installation Method for Arch-Termux

If the automation script does not work, you can follow these manual steps to set up Arch Linux in Termux.

---

## 1. Prepare Termux
Update and upgrade packages, install X11 repo and required packages:
```sh
pkg update && pkg upgrade
pkg install x11-repo
pkg install termux-x11-nightly pulseaudio proot-distro git wget
```

## 2. Install Debian
```sh
proot-distro install archlinux
proot-distro login archlinux
```

## 3. Inside Debian: Initial Setup
Update and install essential packages:
```sh
apt update && apt upgrade -y
pacman -S sudo nano adduser pulseaudio
```

Create a new user:
```sh
adduser user
```
Grant sudo access:
```sh
echo 'user ALL=(ALL:ALL) ALL' > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user
```

## 4. Desktop Environment (Optional)
- XFCE4:
  ```sh
  pacman -S xfce4 xfce4-terminal chromium onboard
  ```
- LXDE:
  ```sh
  pacman -S lxde chromium onboard
  ```
- LXQt:
  ```sh
  pacman -S lxqt chromium onboard
  ```
- MATE:
  ```sh
  pacman -S mate-desktop-environment chromium onboard
  ```

## 5. Exiting Debian
```sh
exit
```

## 6. Adding Desktop Launcher Script (If you installed a Desktop Environment)
Choose your preferred language for the launcher:

- **English version:**
  ```sh
  curl -fsSL https://raw.githubusercontent.com/flasherxgapple/arch-termux/master/arch-en.sh -o ~/arch.sh
  chmod +x ~/arch.sh
  ```
- **Indonesian version:**
  ```sh
  curl -fsSL https://raw.githubusercontent.com/flasherxgapple/arch-termux/master/arch-ind.sh -o ~/arch.sh
  chmod +x ~/arch.sh
  ```

### Using Launcher Script Flags

You can use flags to control the launcher script:

**Usage:**
```sh
./arch.sh [options]
```

**Options:**
- `-h`, `--help`           Show help message and exit (English) / Tampilkan pesan bantuan (Indonesian)
- `-d N`, `--default N`    Set default desktop environment (N):
    - 1 = XFCE4
    - 2 = LXDE
    - 3 = LXQt
    - 4 = MATE
    - 0 = Minimal (no desktop)

**Examples:**
```sh
./arch.sh -d 1     # Launch with XFCE4 as default
./arch.sh -h       # Show help message
```

---

For more details and troubleshooting, refer to the main README or open an issue on GitHub.
