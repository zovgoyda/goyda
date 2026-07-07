#!/bin/bash
# Установка темы Noctalia для SDDM
echo "Установка темы Noctalia для SDDM..."
cd /tmp
git clone https://github.com/mda-dev/noctalia-sddm-theme.git noctalia
cd noctalia
# Запуск установщика
sudo bash ./installer/install.sh
cd ..
rm -rf noctalia
