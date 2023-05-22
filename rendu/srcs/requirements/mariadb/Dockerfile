FROM debian:buster
RUN apt-get update
RUN apt-get install vim mariadb-server -y
WORKDIR /app
COPY ./tools/script.sh ./app/script.sh
CMD service mysql start && tail -f /dev/null