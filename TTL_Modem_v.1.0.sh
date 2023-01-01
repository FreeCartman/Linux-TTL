#!/bin/bash
clear

echo "Этот скрипт предназначен для изменения TTL, по умолчанию задается TTL=65"

read -p "Введите желаемое значение TTL=" newttl

if (( $newttl == 0 || $newttl < 0 )); then
    echo "Вы ввели некоректный TTL=$newttl, попробуйте ввести другое значение"; exit
elif (( $newttl <= 5 )); then
    echo "Вы ввели очень маленький TTL=$newttl, попробуйте ввести большее значение"; exit
else 
    sudo iptables -t mangle -A POSTROUTING -j TTL --ttl-set $newttl
fi
echo "Выбран и установлен TTL=$newttl хорошего серфинга"