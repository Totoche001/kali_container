#!/bin/bash

echo "[+] Création de l'utilisateur 'kali' avec mot de passe 'kali'"
adduser --gecos "" kali
echo "kali:kali" | chpasswd

echo "[+] Ajout de kali au groupe sudo"
usermod -aG sudo kali

echo "[+] Mise à jour complète du système"
apt update && apt full-upgrade -y

echo "[+] Installation de l'environnement Kali par défaut"
apt install -y kali-linux-default

echo "[+] Reboot requis. Voulez-vous redémarrer maintenant ? [y/N]"
read -r reponse
if [[ "$reponse" =~ ^[Yy]$ ]]; then
    reboot
fi
