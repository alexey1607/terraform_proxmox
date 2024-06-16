# tf_labs
tf_labs создаем LXC контейнеры и ВМ на сингл ноде ProxMox с бэкендом на S3 в яндекс клауде

### Создаем файл с энвами 
```
cat ~/.secrets
export ACCESS_KEY=access-key
export SECRET_KEY=secret-key
export TF_VAR_pm_api_token_id=terraform@pam!terraform
export TF_VAR_pm_api_token_secret=secret-token
```
### читаем энвы
```
source ~/.secrets
```

### инициализируем бэкенд 
```
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```
