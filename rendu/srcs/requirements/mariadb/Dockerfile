FROM debian:buster
RUN apt-get update
RUN apt-get install vim mariadb-server -y
WORKDIR /app
COPY ./tools/script.sh ./app/script.sh
EXPOSE 3306
RUN chmod +x ./app/script.sh
CMD ["./app/script.sh"]