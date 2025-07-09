#!/bin/bash

# Définir les URLs des scripts
GITHUB_USER="Totoche001"
REPO_NAME="NOM_DU_DEPOT"
BRANCH="main"  # ou "master"

BASE_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/$BRANCH"

# Noms des scripts
SCRIPT1="setup_serveur_kali.sh"
SCRIPT2="setup_serveur_kali.sh"
SCRIPT3="post-login-RDP.sh"

echo "[+] Téléchargement des scripts depuis le dépôt GitHub public..."

for script in "$SCRIPT1" "$SCRIPT2" "$SCRIPT3"; do
    echo "  -> Téléchargement de $script..."
    curl -fsSL "$BASE_URL/$script" -o "$script"
    chmod +x "$script"
done

echo
echo "=================================================================="
echo "⚙️  INSTALLATION EN 3 ÉTAPES RECOMMANDÉES :"
echo "=================================================================="
echo "1️  Lancez :     ./setup_serveur_kali.sh"
echo "     → Ajoute l'utilisateur, met à jour le système."
echo "     → Reboot ensuite."

echo
echo "2️  Après redémarrage, connectez-vous avec l'utilisateur 'kali'."
echo "     Puis lancez : ./setup_serveur_kali.sh"
echo "     → Installe l’environnement XFCE + RDP."

echo
echo "3️  Redémarrez à nouveau, puis lancez : ./post-login-RDP.sh"
echo "     → Configure le clavier en BE et la langue en fr_BE.UTF-8."

echo
echo " Vous pouvez maintenant vous connecter à l’interface graphique via RDP."
echo "=================================================================="
