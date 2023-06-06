# MariaDB :
## what is the relation between mysql and mariadb ?
MySQL and MariaDB share common origins, In 2009 one of the original creators of MySQL forked MySQL to create a new RDBMS called MariaDB. MariaDB is designed to be highly-compatible with MySQL, applications and tools developed for MySQL can work seamlessly with MariaDB without requiring significant modifications.
Even though MariaDB firstly aimed to be a drop-in replacement for MySQL, it has diverged over time and introduced new features and optimizations.
## What kind of informations tht /etc/mysql/my.cnf contains ?
This line sets the  user, port, socket and bind-address for our MariadDB on a Unix-like system.

## what does the mysql_install_db command does ?
This command is used to initialize the MySQL data directory and create the initial system tables required for the functioning of the MySQL server. Overall it proceeds for the initial set up for mysql to function properly.

## What does the service mysql start do?

this command is used to start the MySQL service.
- Reading the config files
- Memory and Resource Allocation
- Binding to Network Interface 
- Starting the Server Process
- Being Ready for Connections
By starting the mysql service, we enable clients to access and utilize the capabilities of the mysql db server for storing, retrieving and manipulating data.

## what to do after that ?
we usually create a database and a user, and then we grant privileges to this user
when creating a user we type this command in mysql

`echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> db.sql`
`%`: refers to a host, and it's a wildcard allowing connetions from any host.

After doing this, we have to `FLUSH PRIVILEGES`, to reload the mysql privilege table after making changes to user accounts. It tells the server to re-read the grant tables from disk. Generally it ensures that the changes are applied and take effect immediately.

# Nginx config file:
## Why does nginx need a config file ?
A configuration file describe for Nginx how it should handle incoming requests and serve content.
`listen 443 ssl` : listen on port 443, the ssl option indicates that SSL/TLS encryption should be used for these connections.
As we see we did not specify the address, so nginx will listen an all available IP addresses, When we mention "all available IP addresses" in the context of the Nginx "listen" directive, we're referring to all the network interfaces and IP addresses that are configured on the server where Nginx is running.
`server_name`: this defines domain names for which Nginx should process requests.

`ssl_certificate`: with this directive we point to the SSL/TLS certificate by providing the path for it, nginx uses this certificate to secure HTTPS connections.
`ssl_certificate_key`: this is used to specify the path to the private key file associated with the SSL certificate.

It is important to ensure that the certificate files are obtained from a trusted CA or properly self-signed if used for testing or interna purposes.

### Why does nginx need a SSL certficate for encryption ?
The cert allows the server to prove its identity to the client. It contains informations about the server. When the client connects to the server, it verifies the authencity of the certificate to ensure it is communicating with the intended server and not an imposter.

## what bout the ssl_protocols ?
This points to the SSL/TLS protocols that Nginx should support for secure connections. By passing the TLSv1.2 to this directive we tell Nginx to only accept secure connections using the TLS version 1.2 protocol. Any connections attempted with other SSL/TLS versions will be rejected.

## What does the index directive stand for ?
we rely on this directive to specify the default file that should be served when a directory is accessed. The directory where nginx look for this default file is specified by the `root` directive.

## What about the location directive ?
It tells nginx how it should process requests for specific URIs.


### what does the try_files directive do ?
This is used for handling fallback scenarios when a requested file or resource is not found.

### fastcgi_pass
This is used to configure nginx to pass requests to a FastCGI server for processing dynamic content, such as PHP scripts, and `include fastcgi_params` includes a file with FastCGI-specific parameters. this file contains predefined configurations for FastCGI-related parameters such as SCRIPT_FILENAME, REQUEST_METHOD ...

`fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name`:
in this line we used the fastcgi_param directive to set a parameter for the FastCGI server. In this case it sets the SCRIPT_FILENAME parameter, which is a common FastCGI parameter that specifies the path to the script file that should be executed.
`$document_root`: this is an nginx variable that represents the root directory for the current server block. `fastcgi_script_name` this is another nginx variable that represents the path of the requested script within the current location.

## Script:
the command openssl stands for Open secure socket layer. It provides cryptographic functions and protocols, including SSL and TLS. It's used as well for generating self-signed certificates. `req` as an argument indicates the certificate signing request (CSR) functionality of OpenSSL. By adding `-x509` option with the `req` command, you instruct OpenSSL to generate a self-signed X.509 cert directly from the provided information, without the need for a seperate signing process. The `-nodes` stands for "no DES" (Data Encryption Standard), it tells OpenSSL not to encrypt the private key associated with the self-signed cert. Including the `-nodes` option can be useful in situaltions where you want the private key to be accessible without requiring a passphrase each time it is used. `-out` specifies the output file for the self-signed cert. Meanwhile the `keyout` specifies the output file for the private key associated with the certificate. The `-subj` is used to define the subject field of the certificate. The subject field contains information such as the Common Name, Orgranization, Country...etc.

`nginx -g daemon off`
`nginx` : This is the command to start NGINX.
`-g` allows you to pass a configuration directive directly from the command line. 
`daemon off` is the directive being passed.
With this we start nginx in the foreground. This can be useful for debugging or testing purposes when you want to see NGINX's output and logs direclty on the terminal.
Some of the other reasons to run NGINX in the foreground :
1 - When running NGINX within a containerized env, it is common to run NGINX  in the foreground. This allows the container runtime to monitor the main NGINX process and manage it effectively.
2 - Some service managers or process supervisors, such as **systemd**, expect processes to run the foreground.
It's important to note that running NGINX in the foreground may not be suitable for production environments, as it requires a terminal session to be kept open and can prevent NGINX from runningn as a background daemon. In prod, it's generally recommended to run NGINX  as a background process and utilize appropriate process management tools and log monitoring mechanisms.

## Wordpress:
### Why /var/www/html ?
In many server configs, the /var/www/html dir serves as the default document root for web servers like Apache or NGINX. The document root is the dir where the web server looks for files to serve.
When curl-ing we used the -O option to ensure that the downloaded file is saved with the same name as the remote file.

## wp core download --allow-root
wp invoke the WP-CLI tool.
core download: this subcommand that instructs WP-CLI to download the Wordpress core files, those are essential files that make up the wordpress software itself. with `--allow-root` we allow the command to be executed as the root user or with administratvie privileges. If we omit the `--allow-root`, WP-CLI willl perform permission checks to ensure that the command is not executed with superuser privileges, and we will encounter an error message, indicating that the command was unable to validate the installation as a WordPress site.

## Why shall we name it wp-config.php:
Wordpress expects the main config file to be named  wp-config.php.
let's break down the following command:
`sed -i -r "s/'database_name_here'/'$DB_NAME'/1" wp-config.php`
`sed`: stream editing.
`-i`: take in place, refers to the ability to modify a file directly without creating a separate output file
`-r`:The `-r` option enables extended regular expression syntax.

## How does wp core install works ?
this automates the installation process by creating the necessary database tables, generating a config file and setting up the initial site settings.

## Why /etc/php/7.3/fpm/poo.d/www.conf:
this file contains configuration settings for a PHP-FPM pool.

## What is PHP-FPM ?
This is a PHP FastCGI implementation that provides a way to handle PHP requests in a more efficient and scalable manner.

*Using the absolute path to execute a binary directly is suitable for standalone applications or scripts that do not require service management capabilities. On the other hand, the `service` command is more appropriate for managing system services, providing higher-level functionalities and abstraction of the underlying service management system.*
## Who invented curl ?
The original author and lead developer is the Swedish developer Daniel Stenberg, who created cURL

## Why in a multi-containers app we run our services in foreground ?
Debugging , development, monitoring,