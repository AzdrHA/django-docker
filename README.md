```sh
$ cp .env.dist .env
# write data
$ docker-compose build
$ docker-compose run python_api django-admin startproject app .

$ sudo chmod +x ./launch_local.sh
$ sudo chmod +x ./enter.sh
```

### Edit file app/settings.py and set database section as:
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get('DB_DATABASE'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': 'mariadb_api',
        'PORT': os.environ.get('DB_PORT'),
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES', innodb_strict_mode=1",
        },
    }
}
```
