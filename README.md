# README

## Prerequirement

* docker
* docker-compose
* direnv (https://github.com/direnv/direnv)

## Setup

### 1. environment setting

```
cp .envrc.sample .envrc
direnv allow
```

### 2. docker-compose build and up

```
docker-compose build
docker-compose run app db:migrate:reset
docker-compose up
```

* Now, Running app on `localhost:5000` !
