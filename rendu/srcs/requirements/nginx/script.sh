#!/bin/sh
mkdir -p /etc/nginx/ssl
openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout \
/etc/nginx/ssl/private.key -subj /C=MO//L=BN/O=1337/OU=Student/CN=obouizga.42.fr/UID=obouizga
nginx -g "daemon off;"