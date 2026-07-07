#!/bin/bash

# Путь к папке, где лежит этот скрипт
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "Начинаю развертывание конфигов..."

# Массив папок, которые нужно линковать: "имя_папки_в_репо:имя_папки_в_.config"
# Если имена совпадают, можно упростить, но так надежнее
folders=(
    "fastfetch:fastfetch"
    "kitty:kitty"
    "niri:niri"
)

mkdir -p "$CONFIG_DIR"

for item in "${folders[@]}"; do
    src="${item%%:*}"
    dest="${item#*:}"
    
    # Полный путь
    src_path="$REPO_DIR/$src"
    dest_path="$CONFIG_DIR/$dest"

    # Удаляем старое, если это обычный файл или папка
    if [ -e "$dest_path" ] || [ -L "$dest_path" ]; then
        echo "Удаляю существующий конфиг: $dest_path"
        rm -rf "$dest_path"
    fi

    # Создаем симлинк
    ln -s "$src_path" "$dest_path"
    echo "Создана ссылка: $dest_path -> $src_path"
done

echo "Готово! Все конфиги подключены."