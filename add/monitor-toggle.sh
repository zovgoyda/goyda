#!/bin/bash

# Укажите имя вашего монитора
MONITOR="HDMI-A-2"

# wlr-randr без флагов выводит список. Проверяем, активен ли наш монитор
if wlr-randr | grep -A 5 "$MONITOR" | grep -q "Enabled: yes"; then
  # Если включен — выключаем
  wlr-randr --output "$MONITOR" --off
else
  # Если выключен — включаем
  wlr-randr --output "$MONITOR" --on
fi
