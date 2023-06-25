[![CodeFactor](https://www.codefactor.io/repository/github/sergeevpasha/docker-symfony/badge)](https://www.codefactor.io/repository/github/sergeevpasha/docker-symfony)
[![Docker Image CI](https://github.com/sergeevpasha/docker-symfony/actions/workflows/dockerimage.yml/badge.svg)](https://github.com/sergeevpasha/docker-symfony/actions/workflows/dockerimage.yml)
# PHP Symfony

Ready to use environment for Symfony 6+ API projects.
Built on PHP 8.2-FPM image

Main locale: en_US.UTF-8

## ARGS

Feel free to override these args:

```
ARG UNAME=admin
ARG UGROUP=admin
ARG UID=1000
ARG GID=1000
```


## PHP Modules

* bcmath       
* Core
* ctype
* curl
* date
* dom
* exif
* fileinfo
* filter
* ftp
* gd
* gettext
* hash
* iconv
* imap
* intl
* json
* libxml
* mbstring
* openssl
* pcntl
* pcre
* PDO
* pdo_pgsql
* Phar
* posix
* readline
* redis
* Reflection
* session
* SimpleXML
* soap
* sodium
* SPL
* standard
* tokenizer
* xml
* xmlreader
* xmlwriter
* zip
* zlib

# Additional Software
* Cron
* Composer
* Symfony CLI

Example configuration for docker-compose.yml
```
app:
    image: sergeevpasha/php-symfony:latest
    volumes:
        - ./:/var/www
    networks:
        - some-network
```
