# comment

FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install vim nginx openssl -y
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY script.sh /script.sh
RUN chmod +x /script.sh
CMD [ "/script.sh"]