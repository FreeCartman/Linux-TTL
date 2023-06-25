#!/usr/bin/env bash
clear

#ttl2=${1:?Введите значение, например echo $0 65}
ttl2=${1:-65}
if ( $ttl2 >= 6 ); then
    sudo iptables -t mangle -A POSTROUTING -j TTL --ttl-set ttl2
    echo "Выбран и установлен TTL=$ttl2 хорошего серфинга друг!"
else 
if ttl2 == 0 || ttl2 < 0 ; then
    echo "Вы ввели <$ttl2> это некоректное значение TTL, попробуйте ввести другое значение"
    exit
elif (( ttl2 <= 5 )); then
    echo "Вы ввели очень маленький TTL=$ttl2, попробуйте ввести большее значение"
    exit
fi
echo "Выбран и установлен TTL=$ttl2 хорошего серфинга"
fi