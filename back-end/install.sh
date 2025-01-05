#!/bin/bash
echo "Вы выбрали Back-end разработку"
echo "Доступные пакеты для установки: "
echo "1) Node.js"
echo "2) Python"
echo "3) PostgreSQL"
echo "4) Docker"
echo "5) Kubernetes"
echo "Введите номера пакетов через пробел (например, 1 2 3): "
read -r selection
for i in $selection; do
    case $i in
        1)
            echo "Установка Node.js..."
            sudo apt update && sudo apt install -y nodejs npm
            ;;
        2)
            echo "Установка Python..."
            sudo apt update && sudo apt install -y python3 python3-pip
            ;;
        3)
            echo "Установка PostgreSQL..."
            # Обновление списка пакетов
sudo apt update

# Установка необходимых утилит
sudo apt install -y wget gnupg

# Добавление официального репозитория PostgreSQL
            wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
            sudo sudo apt update
            sudo apt install -y postgresql postgresql-contrib
    sudo sed -i "s/127.0.0.1\/32            scram-sha-256/0.0.0.0\/0            md5/" /etc/postgresql/*/main/pg_hba.conf

# Перезапускаем сервер PostgreSQL
sudo systemctl restart postgresql
# Перейти в папку с конфигурацией PostgreSQL
cd /etc/postgresql/17/main

# Разрешить подключения со всех адресов
sudo sed -i "s/^#listen_addresses.*/listen_addresses = '*'/" postgresql.conf

# Добавить правило в pg_hba.conf для подключения с любого IP-адреса
echo "host    all    all    0.0.0.0/0    md5" | sudo tee -a pg_hba.conf

# Перезапустить PostgreSQL, чтобы применить изменения
sudo systemctl restart postgresql

# Разрешить порт 5432 в файрволе
sudo ufw allow 5432/tcp

# Проверить статус PostgreSQL
sudo systemctl status postgresql

            ;;
        4)
            echo "Установка Docker..."
            sudo apt update && sudo apt install -y docker.io
            sudo systemctl start docker
            sudo systemctl enable docker
            ;;
        5)
            echo "Установка Kubernetes..."
            sudo snap install kubectl --classic
            ;;
        *)
            echo "Неверный выбор!"
            ;;
    esac
done
