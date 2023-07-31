# PavelBaburov_infra
PavelBaburov Infra repository

# Home work cloud-bastion
## Подключение к someinternalhost в одну команду
ssh -J 51.250.94.72 10.128.0.20
где:
51.250.94.72 - публичный IP bastion
10.128.0.20 - IP someinternalhost из внутренней подсети

## Подключение к someinternalhost командой 'ssh someinternalhost'
Использовал "stdio forwarding".
Для этого надо прописать настройки в файл .ssh/config
```
Host someinternalhost
        Hostname 10.128.0.20
        ProxyCommand ssh 51.250.94.72 -W %h:%p
```

## VPN config
bastion_IP = 51.250.94.72
someinternalhost_IP = 10.128.0.20

# Homework 06 Основные сервисы Yandex Cloud
testapp_IP = 62.84.118.215
testapp_port = 9292

## Задание со * команда для создания ВМ
yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--metadata-from-file user-data=/home/pavel/Otus/PavelBaburov_infra/cloud-init.config

файл cloud-init.config содержит команды по установке mongodb, git и ruby.

# Homework 07 Packer
1) Создан файл ubuntu16_base.json для создания reddit-base образа.
2) Создан файл ubuntu16.json и variables.json (variables.json.example) для создания reddit-base образа с переменными вынесенными в отдельный файл.

# Задание со звёздочкой
1) Файл immutable.json использует переменные из файла variables.json (variables.json.example) и использует следующие файлы:
- files/reddit.service - копируется в образ для настройки работы reddit как сервиса;
- scripts/install_ruby.sh - усатновка rubby;
- scripts/install_mongodb.sh - установка mongodb;
- files/deploy.sh - установка reddit и регистрация сервиса.
2) Файл config-scripts/create-reddit-vm.sh создаёт ВМ из образа reddit-full
