DEVELOPPER DOCUMENTATION

PREREQUESITES

Operating System: 
- Ubuntu VM with 4 CPUs, 25Gb Hard disk and 8 Gb ram 
Domain Mapping: 
- "127.0.0.1 yroard.42.fr" into /etc/hosts file.
Docker Engine: 
- Official Docker Engine (and the compose plugin) is required. See: https://docs.docker.com/engine/install/ubuntu/ and follow "Install using the apt repository"
- Setup a SSH port into VM network to be able to extract the data from the host into the VM. Host port 42421 ; Guest port: 22; 


SET UP

Into Host terminal:
- git clone the project into a goinfre subfolder.
- run "scp -P 42421 -r ~/goinfre/<subfolder> <VM_user>@127.0.0.1:~/inception"

Into Virtual Machine:

- MAKEFILE USAGE

    - make all: create the directories, setup the creation of SSL certificates and secret files, builds the images and starts the containers in detached mode.

    - make stop: Stops the services without removing them.

    - make down: Removes the stack(containers and networks are removed).

    - make up: containers are created.

    - make clean: remove containers and Docker network.

    - make fclean: The "Nuclear" option as it removes containers, networks, volumes, and images.

    - make re: A full rebuild from scratch.


- DOCKER

    - docker ps: shows all current running containers
    - docker logs <container>: shows all the logs since its start
    - docker -it <container> sh: enter into a container

    - Inside a container: 
        - ls -la /run/secrets/: secrets are mounted but not "baked" into the image.
        - cat /etc/nginx/http.d/default.conf: Show your Nginx config.
        - ps aux: Show that only the necessary processes are running.

- DOCKER VOLUMES

    - docker volume ls: shows the current volumes

- DOCKER COMPOSE:

    - see Makefile.

TESTING THE PROJECT

- Web access: https://yroard.42.fr

- SSL Check: TLS version verification
    "openssl s_client -connect localhost:443 -tls1_2"

- Database Persistence: make down then make up, the data should be kept into Wordpress website.
