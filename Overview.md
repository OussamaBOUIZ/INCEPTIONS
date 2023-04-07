## The Docker Daemon
The Docker daemon (dockerd) listens for Docker API requrests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

## The Docker client
The Docker client (docker) is the primary way that many Docker users interact with Docker. For instance using commands like *docker run*, the client sends these commands to *dockerd*, which carries them out. The *Docker* command uses the Docker API. The Docker client can communicate with more than one daemon.

## Docker registries
A Docker *registry* stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default.

**Docker objects could be images, containers, networks, volumes, plugins, and other objects.**

## Images
An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization.
To build your own images, you could use a *Dockerfile*, this file is created through a simple syntax for defining the steps needed to create the image and run it. 
Each instruction in a Dockerfile creates a **layer** in the image. When you change the *Dockerfile* and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

## Containers
A container is a runnable instance of an image, which can be created, started, stopped, move, or deleted using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.
By default, a container is well isolated from other containers and its host machine. We can control how isolated a container's network, storage, or other underlying subsystems are from other containers or from other containers or from the host 