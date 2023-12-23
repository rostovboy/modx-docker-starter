#!/bin/bash

# Чтение значений переменных из файла .env
database_user=$(grep -oP "(?<=DATABASE_USERNAME=).*" .env)
database_password=$(grep -oP "(?<=DATABASE_PASSWORD=).*" .env)
dbase=$(grep -oP "(?<=DATABASE_NAME=).*" .env)

# Пути к файлам конфигурации
example_config_file="../public/core/config/config.example.inc.php"
config_file="../public/core/config/config.inc.php"

# Создание нового файла конфигурации на основе config.example.inc.php
cp "$example_config_file" "$config_file"

# Установка значений переменных в файле конфигурации
sed -i "s/\$database_user = '.*';/\$database_user = '$database_user';/" "$config_file"
sed -i "s/\$database_password = '.*';/\$database_password = '$database_password';/" "$config_file"
sed -i "s/\$dbase = '.*';/\$dbase = '$dbase';/" "$config_file"
sed -i "s/mysql:host=db;dbname=database;charset=utf8mb4/mysql:host=db;dbname=$dbase;charset=utf8mb4/" "$config_file"

echo "Конфигурационный файл успешно обновлен."