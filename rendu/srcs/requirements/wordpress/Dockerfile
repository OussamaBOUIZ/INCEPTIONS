FROM debian:buster
RUN apt-get -y update && apt-get -y upgrade \
    && apt update -y && apt upgrade -y
RUN apt install php-fpm php-mysql -y && apt install curl -y
WORKDIR /app
COPY ./script.sh /app/script.sh
RUN chmod +x /app/script.sh
CMD ["./script.sh"]