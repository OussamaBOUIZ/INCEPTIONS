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

## Why does nginx need a config file ?
A configuration file describe for Nginx how it should handle incoming requests and serve content.
`listen 443 ssl` : listen on port 443, the ssl option indicates that SSL/TLS encryption should be used for these connections.
As we see we did not specify the address, so nginx will listen an all available IP addresses, When we mention "all available IP addresses" in the context of the Nginx "listen" directive, we're referring to all the network interfaces and IP addresses that are configured on the server where Nginx is running.
`server_name`: this defines domain names for which Nginx should process requests.

`ssl_certificate`: with this directive we point to the SSL/TLS certificate by providing the path for it, nginx uses this certificate to secure HTTPS connections.
`ssl_certificate_key`: this is used to specify the path to the private key file associated with the SSL certificate.

It is important to ensure that the certificate files are obtained from a trusted CA or properly self-signed if used for testing or interna purposes.

### Why does nginx need a SSL certficate for encryption ?
The cert allows the server to prove its identity to the client. It contains informations about the server. When the client connects to the server, it verifies the authencity of the certificate to ensure it is communicating with the intended server and not an imposter