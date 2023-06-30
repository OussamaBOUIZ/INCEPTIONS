# INCEPTIONS
The Project deals with the dockerization of an app that consists of 3 services : nginx, wordpress, mariadb. Each service should be running from a isolated container, and those containers shall be able to connect with each other through a docker network.

*The configurations and set up of the infrastructure for the INCEPTION assignment is located in the Rendu directory*

## What is the problem that docker solves ?
When proceeding for the deployment of applications, there are many bumps on the way, caused by distinctions between operating systems. Those supports different libraries and dependencies, which results in unsimilar environments. This means that the application we developed may not be similarly functional in diverse environments.
Docker deals with this problem through packaging programs along with all their dependencies into lightweight, isolated containers that we can think of briefly as a small virtual machine containing only the sufficing tools to run a specific software.
You could say that virtualization already fixes this issue, but virtual machines are resource-intensive compared to containers which are lightweight.

## What I need to know to get the benefits of docker for my app ?
### 1 - Docker main job:
Docker can bundle an application and its dependiencies in a virtual **container** that can run on any linux, windows or macOS computer. This enbales the application to run iin a variety of location.
### 2 - Docker manages to do so by:
When running on linux, Docker uses the resource isolation features of the linux kernel and a union-capable file system to allow containers to run within a single linux instance. Avoiding the overhead of starting and maintianing VM.
### 3 - Docker nomenclature:
#### The Docker Daemon
The Docker daemon (dockerd) listens for Docker API requrests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.
#### The Docker client
The Docker client (docker) is the primary way that many Docker users interact with Docker. For instance using commands like *docker run*, the client sends these commands to *dockerd*, which carries them out. The *Docker* command uses the Docker API. The Docker client can communicate with more than one daemon.

#### Docker registries
A Docker *registry* stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default.

**Docker objects could be images, containers, networks, volumes, plugins, and other objects.**

#### Images
An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization.
To build your own images, you could use a *Dockerfile*, this file is created through a simple syntax for defining the steps needed to create the image and run it. 
Each instruction in a Dockerfile creates a **layer** in the image. When you change the *Dockerfile* and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

#### Containers
A container is a runnable instance of an image, which can be created, started, stopped, moved, or deleted using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.
By default, a container is well isolated from other containers and its host machine. We can control how isolated a container's network, storage, or other underlying subsystems are from other containers or from other containers or from the host

#### Volumes
Volumes provide the ability to connect specific filesystem paths of the containner back to the host machine. If a directory in the container is mounted

#### Networks
A docker network is a virtual network that allows containers to communicate with each other and with external networks, enabling seamless connectivity and data exchange.

### 4 - Docker compose:
In the fact of an application will not be consisting of one sole container, the most frequent case is having a multi-container application. In this regards, it would be better if we can set up and start all containers from one place. This is what **Docker Compose** do.

With **Docker Compose** we can define **multi-container applications**. Through a YAML file that is located on the root of our project we could define our services, the images they rely on, we can set volumes and networks.
