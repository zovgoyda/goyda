#!/bin/bash

# Проверка, что скрипт запущен с правами root
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите скрипт с помощью sudo или от имени root."
  exit 1
fi

echo "Выполнение первой части..."
# 1. Создание системного пользователя
sudo useradd -r -s /usr/bin/nologin -d /var/lib/noctalia-greeter greeter 2>/dev/null || true

echo "Выполнение второй части..."
# Перед созданием конфига создадим директорию, если её нет
sudo mkdir -p /etc/greetd

# 2. Создание конфигурационного файла config.toml
sudo tee /etc/greetd/config.toml >/dev/null <<'GREETD_CONFIG'
[terminal]
vt = 1

[default_session]
command = "/usr/bin/noctalia-greeter-session"
user = "greeter"
GREETD_CONFIG

echo "Все команды успешно выполнены!"
