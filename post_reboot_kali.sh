#!/bin/bash

echo "[*] Voulez-vous installer XFCE avec NetworkManager et la configuration standard (kali-desktop-xfce) ?"
echo "    [y] Installation complète (plus simple, inclut NetworkManager)"
echo "    [n] Installation personnalisée (plus légère, sans NetworkManager)"
read -p "[y/N]: " choix

if [[ "$choix" =~ ^[Yy]$ ]]; then
    echo "[+] Installation complète avec kali-desktop-xfce"
    apt update && apt install -y kali-desktop-xfce
else
    echo "[+] Installation personnalisée sans NetworkManager"
    apt update && apt install -y \
        qterminal kali-desktop-core xfce4-screensaver xfce4 lightdm pavucontrol \
        qt5ct qt6ct thunar ristretto parole engrampa mousepad mate-calc atril \
        xfce4-taskmanager xfce4-screenshooter thunar-archive-plugin thunar-gtkhash \
        xcape xfce4-cpugraph-plugin xfce4-genmon-plugin xfce4-power-manager-plugins \
        xfce4-whiskermenu-plugin xdg-user-dirs-gtk mate-polkit libspa-0.2-bluetooth \
        pipewire-pulse wireplumber blueman catfish gvfs-backends gvfs-fuse \
        gnome-disk-utility gnome-system-tools kali-hidpi-mode kali-undercover \
        lightdm-gtk-greeter-settings xfce4-panel-profiles onboard \
        xfce4-clipman-plugin xfce4-cpufreq-plugin xfce4-datetime-plugin \
        xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-netload-plugin \
        xfce4-places-plugin xfce4-sensors-plugin xfce4-systemload-plugin \
        xfce4-timer-plugin xfce4-verve-plugin xfce4-wavelan-plugin \
        xfce4-xkb-plugin nano
fi

echo "[+] Installation du support RDP et affichage"
apt install -y xorg xrdp
systemctl enable --now xrdp

echo "[*] Installation terminée. Rebooter maintenant ? [y/N]"
read -r rep
if [[ "$rep" =~ ^[Yy]$ ]]; then
    reboot
fi
