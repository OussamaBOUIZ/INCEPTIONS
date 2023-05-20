## What is Docker ?
Docker is a Paas Software that uses OS level virtualization to provide software in **sandboxed processes** known as **Containers**.

## What its Operation ?
Docker can bundle an application and its dependiencies in a virtual **container** that can run on any linux, windows or macOS computer. This enbales the application to run iin a variety of location.

## How Docker manages to do so ?
When running on linux, Docker uses the resource isolation features of the linux kernel and a union-capable file system to allow containers to run within a single linux instance. Avoiding the overhead of starting and maintianing VM.

## Docker Components
### Software
**dockerd** the docker daemon is a persistent process that manages Docker containers and handle container objects. **dockerd** listens for requests sent via the Docker Engine API. The Docker client program, called **docker** provides a CLI that allows users to interact with Docker daemons.

### Docker build:
Docker uses a layered architecture for building images. Each instruction in the Dockerfile creates a new layer in the image. Layers are lightweight and represent increhowmental changes to the image. This layering alllows for efficient caching and reusability of previously built layers during subsequent builds, which helps to speed up the build process.