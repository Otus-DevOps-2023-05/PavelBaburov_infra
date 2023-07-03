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
