#!/bin/bash

# 1. Обновление системы и установка базовых зависимостей из официальных репозиториев
echo "Установка базовых пакетов..."
sudo pacman -Syu --needed \
    niri kitty fastfetch zsh thunar firefox cmake wl-clipboard kdeconnect sddm rust lact \
    git libcanberra ttf-jetbrains-mono noto-fonts-cjk jq xlibre-xserver-common

# 2. Установка paru (AUR-хелпера)
# Проверяем, установлен ли уже paru, чтобы не тратить время
if ! command -v paru &> /dev/null; then
    echo "Установка paru..."
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
else
    echo "Paru уже установлен."
fi

# 3. Установка пакетов из AUR
echo "Установка пакетов из AUR (noctalia-shell-git, happ-desktop-bin, vesktop)..."
paru -S --needed noctalia-shell-git happ-desktop-bin vesktop-bin

# 4. Установка темы Noctalia для SDDM
echo "Установка темы Noctalia для SDDM..."
cd /tmp
git clone https://github.com/mda-dev/noctalia-sddm-theme.git noctalia
cd noctalia
# Запуск установщика
sudo bash ./installer/install.sh
cd ..
rm -rf noctalia

echo "---"

echo "Все готово! Система настроена."

echo "---"
