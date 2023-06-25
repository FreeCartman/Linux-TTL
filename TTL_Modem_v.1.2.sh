#!/usr/bin/env bash
clear

RED='\033[1;31m'
NC='\033[0m'
ttl=${1:-65}

printf "\n\nЭтот скрипт предназначен для изменения TTL, если значение не указано по умолчанию будет установлено значение TTL=65\n\n"

if [ $EUID -ne 0 ]; then
	printf "\n\n${RED}Пожалуйста запустите скрипт от иммени root !!!${NC}\n"
	exit 1
fi

if  [ "$ttl" -gt "6" -a "$ttl" -lt "300" ] ; then
        iptables -t mangle -A POSTROUTING -j TTL --ttl-set ttl 2>/dev/null
        printf "\nВыбран и установлен TTL=ttl хорошего серфинга друг!\n"
        #echo "Выбран и установлен TTL=$ttl хорошего серфинга друг!"
        exit 1

        elif (( ttl == 0 || ttl < 0 )); then
            echo "Вы ввели <$ttl> это некоректное значение TTL, попробуйте ввести другое значение"
            exit 1

        elif (( ttl <= 5 )); then
            echo "Вы ввели очень маленький TTL=$ttl, попробуйте ввести большее значение"
            exit 1

        elif (( ttl > 300 )); then
            echo "Вы ввели очень большой TTL=$ttl, попробуйте ввести меньшее значение"
            exit 1
        else
            exit 1
fi

echo "Выбран и установлен TTL=$ttl хорошего серфинга"
