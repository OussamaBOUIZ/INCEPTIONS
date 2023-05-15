# STEPS TO ACCOMPLISH INCEPTION

## What is required to do ?
The subject asks for the dockerization of an app that consists of 3 services : nginx, wordpress, mariadb. Each service should be running from a isolated container, and those containers shall be able to connect with each other through a docker network. The whole work should be delivered inside a VM.

The subject asks for the set up of a small *infrastructure*, that consist of three mandatory services, each service has to run in a dedicated *container*, hence relies on a dedicated *dockerfile*. A *Makefile* has to call the *dockerfiles* inside *docker-compose.yml*.
The *Docker images* used in the project should be developed by us, and its forbidden to *pull* ready-made *Docker images*, unless we use (Alpine/Debian). 
Therefore we need :
A **container** for *NGINX TLSv1.2 or TLSv1.3*, a **container** for *Wordpress + php-fpm*, a **container** for *MariaDB*

A **volume** for the wordpress database, a secodn volume for the WordPress websites files.

A **docker-network** for enable *containers* to connect.

### NGINX Service:
The *Nginx container* must be the only entrypoint into our *infrastructure* via the port 443 only.

### WordPress Service:
In the WordPress DB, there must be two users, one of them being the admin. We have to configure our domain name so it points to our local IP address. The domain name must be login.42.fr.

### Volumes:
Volumes will be available in the /home/login/data folder of the host machine using Docker.

### Docker images:
The *latest* tag is prohibited

### .env file:
It is strongly recomended to use the *.env* file to store environment variables which are indeed mandatory. The *.env* file should be located in the `srcs/` folder