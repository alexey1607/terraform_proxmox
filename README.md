# terraform labs
tf_labs создаем LXC контейнеры и ВМ на сингл ноде ProxMox с бэкендом на S3 в яндекс клауде

## Создаем пользователя и выдаем права на создание VM и LXC контейнеров.


##### Создать пользователя
```
pveum user add terraform@pam
```

##### Задаем пароль пользователю
```
pveum passwd terraform@pam
```

##### Выдаем пользователю права администратора
```
pveum aclmod / -user terraform@pam -role Administrator
```

##### Проверяем права
```
pveum acl list
┌──────┬────────────┬──────┬───────────────┬───────────┐
│ path │ roleid     │ type │ ugid          │ propagate │
╞══════╪════════════╪══════╪═══════════════╪═══════════╡
│ /    │ PVEVMAdmin │ user │ terraform@pve │ 1         │
└──────┴────────────┴──────┴───────────────┴───────────┘
```

##### Создаем токен для пользователя
```
root@pve:~# pveum user token add terraform@pam tf-token --privsep 0 --expire 0
┌──────────────┬──────────────────────────────────────┐
│ key          │ value                                │
╞══════════════╪══════════════════════════════════════╡
│ full-tokenid │ terraform@pam!tf-token               │
├──────────────┼──────────────────────────────────────┤
│ info         │ {"expire":"0","privsep":"0"}         │
├──────────────┼──────────────────────────────────────┤
│ value        │ ed22b936-87bd-45fb-9db5-0c9947a1990b │
└──────────────┴──────────────────────────────────────┘
```

##### Создаем файл с энвами 
```
cat ~/.secrets
export ACCESS_KEY=access-key
export SECRET_KEY=secret-key
export TF_VAR_pm_api_token_id=full-tokenid
export TF_VAR_pm_api_token_secret=value
```

##### читаем энвы
```
source ~/.secrets
```

##### инициализируем бэкенд 
```
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```

## Post install

##### Обновляем доступные lxc шаблоны
```
pveam update
```

##### Смотрим доступные системные шаблоны
```
root@pve:~# pveam available --section system
system          almalinux-9-default_20240911_amd64.tar.xz
system          alpine-3.19-default_20240207_amd64.tar.xz
system          alpine-3.20-default_20240908_amd64.tar.xz
system          alpine-3.21-default_20241217_amd64.tar.xz
system          archlinux-base_20240911-1_amd64.tar.zst
system          centos-9-stream-default_20240828_amd64.tar.xz
system          debian-11-standard_11.7-1_amd64.tar.zst
system          debian-12-standard_12.7-1_amd64.tar.zst
system          devuan-5.0-standard_5.0_amd64.tar.gz
system          fedora-40-default_20240909_amd64.tar.xz
system          fedora-41-default_20241118_amd64.tar.xz
system          fedora-42-default_20250428_amd64.tar.xz
system          gentoo-current-openrc_20231009_amd64.tar.xz
system          openeuler-24.09-default_20241118_amd64.tar.xz
system          opensuse-15.6-default_20240910_amd64.tar.xz
system          rockylinux-9-default_20240912_amd64.tar.xz
system          ubuntu-20.04-standard_20.04-1_amd64.tar.gz
system          debian-12-standard_12.7-1_amd64.tar.zst
system          ubuntu-24.04-standard_24.04-2_amd64.tar.zst
system          ubuntu-24.10-standard_24.10-1_amd64.tar.zst
```

##### Скачиваем нужный шаблон
```
root@pve:~# pveam download local ubuntu-24.10-standard_24.10-1_amd64.tar.zst
...
cache/ubuntu-24.10-standard_24.10-1_amd64.tar.zst' finished
```

##### Просмотр скаченных шаблонов
```
root@pve:~# pveam list local
NAME                                                         SIZE
local:vztmpl/alpine-3.21-default_20241217_amd64.tar.xz       3.01MB
local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst         120.65MB
local:vztmpl/ubuntu-24.10-standard_24.10-1_amd64.tar.zst     136.83MB
```
