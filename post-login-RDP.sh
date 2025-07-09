#!/bin/bash

echo "[+] Configuration du clavier belge..."
sudo sed -i 's/XKBLAYOUT=.*/XKBLAYOUT="be"/' /etc/default/keyboard
sudo dpkg-reconfigure -f noninteractive keyboard-configuration
sudo service keyboard-setup restart

echo "[+] Configuration du clavier BE au démarrage de session"
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/setkeyboard.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=setxkbmap be
Hidden=false
X-GNOME-Autostart-enabled=true
Name=Clavier BE
EOF

echo "[+] Installation de la langue française (fr_BE.UTF-8)"
sudo apt install -y locales task-french
sudo sed -i 's/# fr_BE.UTF-8 UTF-8/fr_BE.UTF-8 UTF-8/' /etc/locale.gen
sudo dpkg-reconfigure locales
update-locale LANG=fr_BE.UTF-8

echo "[+] Redémarrage requis pour appliquer les paramètres linguistiques"
read -p "Redémarrer maintenant ? [y/N]: " rep
if [[ "$rep" =~ ^[Yy]$ ]]; then
    sudo reboot
fi
