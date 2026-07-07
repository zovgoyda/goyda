#!/bin/bash

# 1. Обновление системы и установка базовых зависимостей из официальных репозиториев
echo "Установка базовых пакетов..."
sudo pacman -Syu --noconfirm --needed \
    niri kitty fastfetch zsh thunar firefox cmake wl-clipboard kdeconnect sddm rust lact \
    git libcanberra ttf-jetbrains-mono noto-fonts-cjk jq

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
paru -S --noconfirm noctalia-shell-git happ-desktop-bin vesktop

echo "Все готово! Система настроена."
