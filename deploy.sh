#!/bin/bash

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "Начинаю развертывание конфигов..."

folders=(
    "fastfetch:fastfetch"
    "kitty:kitty"
    "niri:niri"
)

mkdir -p "$CONFIG_DIR"

for item in "${folders[@]}"; do
    src="${item%%:*}"
    dest="${item#*:}"
    
    src_path="$REPO_DIR/$src"
    dest_path="$CONFIG_DIR/$dest"

    if [ -e "$dest_path" ] || [ -L "$dest_path" ]; then
        echo "Удаляю существующий конфиг: $dest_path"
        rm -rf "$dest_path"
    fi

    ln -s "$src_path" "$dest_path"
    echo "Создана ссылка: $dest_path -> $src_path"
done

echo "Готово! Все конфиги подключены."
