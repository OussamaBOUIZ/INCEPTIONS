FROM debian:buster
RUN apt-get -y update && apt-get -y upgrade 
RUN apt-get install vim php-fpm php-mysql -y && apt-get install curl -y
WORKDIR /app
COPY ./script.sh /app/script.sh
RUN chmod +x /app/script.sh
CMD ["/app/script.sh"]