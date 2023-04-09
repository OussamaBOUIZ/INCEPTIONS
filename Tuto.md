1 - After creating a Dockerfile, which is a text document that contains *commands a user could call on the command line to assemble an image*, we ran `docker build` command, this one uses the Dockerfile to build a new container image. As we noticed the Docker downloaded a lot of *layers*. This is because we instructed the builder that we want to start from the `node:18-alpine` image. But since we did not have that on our machine, Docker needed to download the image.
2 - Now in order to start a container based on the built image, we hit `docker run`, using the following command 
`docker run -dp 3000:3000 getting-started` with -d we specify that we want the container to run in detached mode, by -p 3000:3000 we map port 3000 on the host port 3000 on the container. We ran the application on localhost:3000, and it seems to work decently.

3 - We want now to update the application, we did so by adding a change to a specific js file. We built a container image through the `docker build` command, we ran `docker run -dp 3000:3000 getting-started` and we got an error message, saying that the port 3000 is alreaddy in use. This means that the old container is still running and only one process on the machine can listen to a specific port.

4 - We need to remove the old container, first we need to get the container id, we do so through `docker ps`, then we run `docker stop <the-container-id>`, this stops the container, then we could remove it through `docker rm <the-container-id>`, we run a new container based on the built image, and we launch it 
and we see that the app have changes. In future, we'll learn how to see code updates without needing to rebuild and start a new container every time we make change.

5 - 

