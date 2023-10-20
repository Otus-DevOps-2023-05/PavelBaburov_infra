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

## Задание со звёздочкой
1) Файл immutable.json использует переменные из файла variables.json (variables.json.example) и использует следующие файлы:
- files/reddit.service - копируется в образ для настройки работы reddit как сервиса;
- scripts/install_ruby.sh - усатновка rubby;
- scripts/install_mongodb.sh - установка mongodb;
- files/deploy.sh - установка reddit и регистрация сервиса.
2) Файл config-scripts/create-reddit-vm.sh создаёт ВМ из образа reddit-full

# Homework 08 Terrafrom-1
1) Созданы следующие файлы:
- main.tf - содержит интсрукции по созданию инстанса ВМ с Reddit из базового образа;
- variables.tf - описание переменных;
- terraform.tvars - сами переменные (terraform.tvars.example - файлик с фейковыми переменными для проверки);
- outputs.tf - выходные переменные.

## Задание со *
1) Создан файл:
- lb.tf - содержит инструкции по созданию баланчировщика нагрузки и групп для него;
2) Для оптимизации кода использована опция Count для создания нескольких ВМ.

# Homework 09 Terrafrom-2
1) Созданы модули:
- db - ВМ с базой данных MongoDB;
- app - ВМ для Reddit;
2) Созданы папкие stage и prod для разворачивания ВМ для stage и prod окружения;

## Задание со *
1) Создано хранилище S3 в Яндекс облаке. Создан файл backend.tf в папках stage и prod для хранения terraform.tfstate в S3.
2) В модули добавлены скрипты для настройки MongoDB и установки и настройки Reddit после развёртывния ВМ.
Таким образом после запуска ВМ Reddit готов к работе.

# Homework 10 Ansible-1
1) Созданы файлы invetory:
inventory - формат INI;
inventory.yml - формат YAML.
2) Создан плейбук clone.yml - при первом выполнении он ничего не сделал, потому что reddit был уже склонирован из git-а.
После выполнения скрипта 'ansible app -m command -a 'rm -rf ~/reddit'' плейбук во время выполния склонировал reddit.

## Задание со *
1) сделал inventory файл в формате json и проверил выполнение плейбука с его использованием - работает.
Статитческий и динамический inventory.json отличаются тем, что статический создаётся вручную и изменения вносятся вручную, динамический создаётся скриптом или плгином - не разбирался как это работает детально.

# Homework 11 Ansible-2
1) Созданы плейбуки с тегами:
reddit_app_one_play.yml
reddit_app_multiple_plays.yml

2) Создан плейбуки
site.yml
db.yml
app.yml
deploy.yml
для отдельного выполнения задач по установке и настройке приложений.

## Задание со * не делал.
=======
