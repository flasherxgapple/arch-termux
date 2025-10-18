# Arch-Termux Setup
This is Indonesian readme file. if u want English click here [README.md](./README.md)

![Bash Script](https://img.shields.io/badge/bash_script-%23121011.svg?style=flat&logo=gnu-bash&logoColor=white) ![Arch](https://img.shields.io/badge/Arch_Linux-1793D1?style=flat&logo=arch-linux&logoColor=white) ![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black) ![Android](https://img.shields.io/badge/Android-34A853?style=flat&logo=android&logoColor=white)

## Tentang Project Ini
Installer Arch Linux untuk Termux (Android) dengan script. Tanpa Root! Pilih antara Arch minimal atau dengan desktop environment (XFCE4,MATE,LXQT,LXDE) dengan chromium dan keyboard onboard.

---

## Fitur
- Instalasi otomatis ArchLinux di Termux (Tanpa root)
- Pembuatan user dan penyiapan Superuser
- Penginstalan desktop environment
- Firefox dan keyboard Onboard sebagai pendukung
- Langkah mudah & interaktif
- Berbahasa Inggris & Indonesia
- Fitur Failsafe

---

## Persyaratan

### Persyaratan Minimal
- Android 7.0 Nougat atau lebih tinggi
- 2 GB RAM (Minimum)
- Koneksi internet yg stabil
- Penyimpanan yang mencukupi (lihat opsi Desktop Environment dibawah)

### Persyaratan Software
- Termux (Direkomendasikan pemasangan dari [F-Droid](https://f-droid.org/id/packages/com.termux/))
- Termux X11 untuk dukungan grafis (desktop environment) ([Termux X11 releases](https://github.com/termux/termux-x11/releases/tag/nightly))

<details>
<summary><strong>Opsi Desktop Environment & ukuran Download</strong></summary>

- <strong>Minimal (Tanpa desktop environment):</strong>
  - Hanya program yg dibutuhkan (sudo, nano, adduser, pulseaudio)
  - installasi tercepat, download terkecil (~50-100 MB)

- <strong>XFCE4 Desktop Environment:</strong>
  - XFCE4, XFCE4 Terminal, Firefox ESR, Onboard
  - Ringan dan cocok untuk segala perangkat
  - Ukuran Download: ~400-600 MB
  - Ukuran Installasi: ~1.2-1.5 GB

- <strong>LXDE Desktop Environment:</strong>
  - LXDE, Firefox ESR, Onboard
  - Ringan, tampilan klasik
  - Ukuran Download: ~300-500 MB
  - Ukuran Installasi: ~1-1.2 GB

- <strong>LXQt Desktop Environment:</strong>
  - LXQt, Firefox ESR, Onboard
  - Ringan, tampilan modern
  - Ukuran Download: ~350-550 MB
  - Ukuran Installasi: ~1-1.3 GB

- <strong>MATE Desktop Environment:</strong>
  - MATE, Firefox ESR, Onboard
  - Klasik, stabil
  - Ukuran Download: ~500-700 MB
  - Ukuran Installasi: ~1.2-1.7 GB

<em>Ukuran sebenarnya tergantung repository dan mirror(server) yang digunakan. Pastikan untuk memiliki penyimpana yang cukup dan kecepatan internet yang stabil.</em>
</details>

---


## Setup Otomatis (Disarankan)

---

Project ini memiliki 2 script untuk dijalankan

### 1. Script Penyiapan Termux
Script ini Mengupdate Termux, Memasang program yg diperlukan, serta memasang Debian
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/flasherxgapple/arch-termux/master/termux-setup.sh)"
```

### 2. Script Instalasi Debian
Jalankan script kedua ini didalam shell arch linux. script ini akan mempersiapkan arch linux layaknya installer desktop seperti menyiapkan user dan memasang desktop environment
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/flasherxgapple/arch-termux/master/arch-setup.sh)"
```

---

## Opsi Flag pada Script Desktop

Script peluncur desktop (`arch.sh`) mendukung flag command-line untuk kemudahan penggunaan:

**Penggunaan:**
```sh
./arch.sh [opsi]
```

**Opsi:**
- `-h`, `--help`           Tampilkan pesan bantuan dan keluar
- `-d N`, `--default N`    Pilih desktop environment default (N):
    - 1 = XFCE4
    - 2 = LXDE
    - 3 = LXQt
    - 4 = MATE
    - 0 = Minimal (tanpa desktop)

**Contoh:**
```sh
./arch.sh -d 1     # Jalankan dengan XFCE4 sebagai default
./arch.sh -h       # Tampilkan pesan bantuan
```

---


## Jika script otomatis gagal. ada cara manual
Lihat [manual/manual.md](./manual/manual.md) Untuk instruksi langkah-langkah instalasi manual.

---

## Credits
Tutorial & Script oleh [@Flasherxgapple](https://github.com/Flasherxgapple)

## Lisensi
Lihat [LICENSE](./LICENSE)
