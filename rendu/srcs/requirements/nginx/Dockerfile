# comment

FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install nginx openssl -y
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY script.sh /script.sh
RUN chmod +x /script.sh
EXPOSE 443
CMD [ "/script.sh"]