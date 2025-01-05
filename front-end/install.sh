#!/bin/bash
echo "Вы выбрали Front-end разработку"
echo "Доступные пакеты для установки: "
echo "1) Node.js (с npm и yarn)"
echo "2) Visual Studio Code"
echo "3) React"
echo "4) Angular"
echo "Введите номера пакетов через пробел (например, 1 2 3): "
read -r selection
for i in $selection; do
    case $i in
        1)
            echo "Установка Node.js, npm и yarn..."
            sudo apt update && sudo apt install -y nodejs npm
            sudo npm install --global yarn
            ;;
        2)
            echo "Установка Visual Studio Code..."
            sudo snap install --classic code
            ;;
        3)
            echo "Установка React..."
            sudo npm install -g create-react-app
            ;;
        4)
            echo "Установка Angular..."
            sudo npm install -g @angular/cli
            ;;
        *)
            echo "Неверный выбор!"
            ;;
    esac
done
