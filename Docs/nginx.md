# NGINX SERVICE SETUP
after pulling the debian image from dockerhub, and installing both nginx and OpenSSL, we'll have to *generate a self-signed SSL/TLS certificate and private key using OpenSSL*.
we have the following command:

```sh
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=[sahafid.1337.ma](http://sahafid.42.ma/)"
```
`req`: This command is used to generate a certificate signing request (CSR) or a self-signed certtificate.
`-x509`: This option tells OpenSSL to generate a self-signed certificate instead of a CSR.
`-nodes`: This option tells OpenSSL not to encrypt the private key with a passphrase
`-days`: This option specifies the number of days that the certificate should be valid for.
`-newkey`: This option specifies that a new private key should be generated.
`rsa:2048`: This argument tells OpenSSL to generate an RSA key with a length of 2048 bits.
`-keyout`: This option specifies the file where the private key should be stored, and the `-out` option defines the file where the certificate should be stored.
`-subj`: This option refers to the subject of the certificate. The subject includes information about the organization that the certifcate will be used for, as well as information about the server where the ceritficate will be installed.

**After running this command, a self-signed SSL/TLS cert and private key will be generated and stored in pre-defined files. We can then use these files to configure an NGINX server to use SSL/TLS encryption. Keep in mind that self-signed certi are not rusted by most web browsers, so you will typically need to obtain a cert from a trusted cert authority for use in a production envrionment.**

