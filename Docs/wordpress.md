# WORDPRESS SERVICE:
Wordpress is a famous **Content Management System**, which allows people with no technical skills to build and manage websites, in addition to field practicians. Wordpress is coded in **PHP** and paired with a **MySQL** or **MariaDB**. Wordpress comes with a **plugin architecture** and a **template system**.
## PHP-FPM (PHP FastCGI Process Manager)
Within wordpress, this service's going to consist of **php-fpm** as well, this one is a fastCGI process manager that handles PHP requests, and it's associated with a web server in order for it to function.
As we mentioned WordPress is coded with PHP, **PHP-FPM** handles a major role in executing PHP code and generating web pages.
Let's formulate how both Wordpress and PHP-FPM work together:
The web server assigns the handling of PHP requests to the FastCGI. What happens is that when a request for a PHP script for instance a WP page, is sent to the web server - in our case nginx -, Nginx addresses  this request to **PHP-FPM** to handle it. Besides that, for the execution of PHP code,the **FastCGI Process Manager** would assign a worker process which will load the required modules, libs..etc and execute the PHP code and generate HTML content. In addition the interaction between wordpress PHP and the database is facilitated by **PHP-FPM**. 

To summarize, **PHP-FPM** controls a pool of processes known as *workers*, that handle the functionning of PHP code inside WordPress.

## PHP-MySQL
Obviously, our wordpress should be able to interact with the database, hence it will rely on **PHP-MySQL** for doing this.This extension grant:
* Database Connection Establishing
* Queries Execution
* Processing Query Results
* Handling Errors