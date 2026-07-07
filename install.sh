#!/bin/bash

# 1. Обновление системы и установка базовых зависимостей из официальных репозиториев
echo "Установка базовых пакетов..."
sudo pacman -Syu --needed niri kitty fastfetch zsh thunar firefox cmake wl-clipboard kdeconnect sddm sddm-dinit rust lact lact-dinitgit libcanberra ttf-jetbrains-mono noto-fonts-cjk jq xlibre-xserver-common nwg-look turnstile-dinit dbus-dinit pipewire-dinit pipewire-pulse-dinit wireplumber-dinit feh

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
echo "Установка пакетов из AUR"
paru -S --needed noctalia-shell-git happ-desktop-bin vesktop-bin adw-gtk-theme apple_cursor

# 4. Установка Zsh4Humans
echo "Установка Zsh4Humans..."
if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
else
    sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
fi

echo "---"

echo "Все готово! Система настроена."

echo "---"
