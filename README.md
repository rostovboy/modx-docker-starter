Docker Starter for MODX2

cd docker

cp .env.example .env

run config.sh: 

bash configure.sh (Windows) or ./configure.sh (Linux)

docker compose build --pull --no-cache

docker compose up

docker ps (get container name)

docker exec -it modx-docker-starter_app-php-fpm /bin/sh

php -m -c

exit

login http://localhost:8885/manager

user: developer

pass: password

