𝘛𝘩𝘪𝘴 𝘱𝘳𝘰𝘫𝘦𝘤𝘵 𝘩𝘢𝘴 𝘣𝘦𝘦𝘯 𝘤𝘳𝘦𝘢𝘵𝘦𝘥 𝘢𝘴 𝘱𝘢𝘳𝘵 𝘰𝘧 𝘵𝘩𝘦 42 𝘤𝘶𝘳𝘳𝘪𝘤𝘶𝘭𝘶𝘮 𝘣𝘺 𝘺𝘳𝘰𝘢𝘳𝘥

INCEPTION 42 PROJECT

Description :

    A complete infrastructure using Docker Compose, featuring Nginx (TLS 1.2/1.3), WordPress (PHP-FPM), and MariaDB, all running on Alpine Linux.

    Inception project helps the student to understand the interest of containers when deploying a solution and especially Docker and Docker compose tools. 
    Thanks to this project, the student will be able to :
        1. create different containers: 
        - a database: Mariadb, 
        - a server: Nginx,
        - a website: WordPress
        2. link them with Docker compose
        3. use the volumes
        4. install a virtual machine and use it for this project


Project description :

    Once a program has been created and passed all the tests, developer are 
    confronted to missing dependencies or OS issues when installing it on 
    another computer. Thanks to Docker, these burdens are removed! 
    Docker is indeed a tool designed to make it easier to create, deploy,
    and run applications by using containers.

    ◦ Virtual Machines vs Docker
        Docker containers are lightweight alternatives to Virtual Machines.
        However Docker are limited to Linux host whereas VM are not limited to.
        VM are isolated from hardware, whereas docker containers use the host kernell.

    ◦ Secrets vs Environment Variables
        - When you pass passwords via .env, they are stored in the container's metadata. If an attacker runs "docker inspect <container_id>", they will see all your passwords (root pass, user pass, etc.) in plain text under the Env section! It is not the case if the passwords are into secrets folder: Docker mounts secrets as files in a temporary in-memory filesystem (tmpfs) at /run/secrets/. Because it is in-memory, the sensitive data is never written to the actual hard drive of the container. When the container stops, the "file" simply vanishes from the internal storage.
        -  Often, a single .env file is loaded by all services, meaning the Nginx container might have access to the MariaDB root password even though it doesn't need it. In our compose.yaml, we explicitly choose which container gets which secret. Nginx only sees the SSL key, while MariaDB only sees the database passwords. This limits the "blast radius" if one container is compromised.

    ◦ Docker Network vs Host Network
        Thanks to command "driver: bridge" into compose.yaml, Docker creates a private virtual network inside our computer. In that case:
        - each container is isolated from the outside world unless you       explicitely open a door using "ports:" (as we do for nginx)
        - an internal DNS server allows containers to talk to each other by name
        Instead, by using "network_mode: host":
        - No isolation: The container shares the host’s IP address and ports. If the container listens on port 80, your computer is now listening on port 80.
        - No Port Mapping: You cannot use -p 8080:80. Since the container is directly on the host, it is the host.[4]
        - The "Localhost" Rule: Inside the container, localhost refers to your real computer.
        - Performance: It is slightly faster because there is no virtual routing layer, but it is much less secure.

    ◦ Docker Volumes vs Bind Mounts
    - Docker Volumes:
        A Volume is a storage space completely managed by Docker. You don't usually care where it is on the hard drive; you just give it a name.
        How it looks in Compose: "driver: local" (without device options).
    Pros:
        * Performance: On non-Linux systems (Mac/Windows), Volumes are much faster than Bind Mounts.
        * Isolation: The files are stored in a Docker-protected area (usually /var/lib/docker/volumes/). No "UID/GID" conflict with the host user.
        * Lifecycle: Docker handles the creation and deletion.
    Cons:
        * Hidden: It is harder to find the files on the Host to verify they are there.
        * Abstraction: You don't have direct control over the physical path on the disk.
    - Bind Mounts
        A Bind Mount is a direct "link" to a specific, existing path on your Host machine (your VM or iMac).
        How it looks in Compose: "type: bind" or simply "./data:/var/lib/mysql"
    Pros:
        * Visibility: You can see and edit the files directly on your Host machine using ls, vim, or a file explorer.
        * Control: You decide exactly where the files live (e.g., /home/yroard/data/mariadb). 
    Cons:
        * Permissions: You run into the "Permission Denied" errors because the Host user and Container user must have matching UIDs.
        * Portability: If you hardcode /home/yroard/, your project will break on a machine where the user is named student.
        * Dependency: The folder must exist on the Host before the container starts.


Instructions :

See DEV_DOC or USER_DOC



Ressources :

Understanding Docker:
https://docs.docker.com/get-started/docker-overview/
https://docs.docker.com/build/building/best-practices/
https://docs.docker.com/engine/install/ubuntu/
https://docs.docker.com/engine/install/linux-postinstall/
https://www.geeksforgeeks.org/devops/difference-between-docker-and-virtualization/
https://forums.docker.com/t/understanding-security-implications-of-secrets-vs-env-vars-in-docker-compose/145903
https://stackoverflow.com/questions/44615837/why-is-docker-secrets-more-secure-than-environment-variables
https://docs.docker.com/engine/swarm/secrets/
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-debian-10
https://docs.docker.com/reference/dockerfile#arg
Webserv tutorial:
https://tuto.grademe.fr/inception/
Alpine releases:
https://alpinelinux.org/releases/
Help on Nginx:
https://nginx.org/en/docs/ngx_core_module.html#daemon
https://blog.stephane-robert.info/docs/services/web/nginx/
https://wiki.alpinelinux.org/wiki/Nginx
https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_param
Help on Openssl:
https://linuxcommandlibrary.com/man/openssl-req
Help on MariaDB:
https://wiki.alpinelinux.org/wiki/MariaDB
https://mariadb.com/docs/server/clients-and-utilities/deployment-tools/mariadb-secure-installation
https://hub.docker.com/_/mariadb
https://aymeric-cucherousset.fr/installer-mariadb-sur-debian-11/
https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04-quickstart-fr
https://mariadb.com/docs/server/server-management/starting-and-stopping-mariadb
https://mariadb.com/docs?q=mariadb-server-system-variables#bootstrap
Help on WordPress:
https://wp-cli.org/#installing
https://mricher.fr/post/all-php-modules-for-alpine/
https://docs.php.earth/docker/alpine/
https://developer.wordpress.org/cli/commands/core/download/
https://developer.wordpress.org/cli/commands/config/create/
Help on Docker compose:
https://docs.docker.com/compose/intro/compose-application-model/
https://docs.docker.com/compose/how-tos/startup-order/
Help on Virtual Box(VM):
https://www.virtualbox.org/manual/ch01.html
https://wiki.debian.org/DebianInstaller
https://www.qemu.org/docs/master/system/invocation.html
https://wiki.debian.org/QEMU



AI used:
https:://aistudio.google.com/
prompt: "I am a 42 student and I would like you guide me to the solution giving examples or websites to dig on features I need to understand and apply in the current project. Caution: I don't want you give me the code solution."
Parts of the project used with AI:
- readme:
    ◦ Virtual Machines vs Docker
    ◦ Secrets vs Environment Variables
    ◦ Docker Network vs Host Network
    ◦ Docker Volumes vs Bind Mounts
- Docker installation
- nginx container creation
- mariaDB database creation
- wordpress creation
- Makefile creation
- Virtual Machine Installation


	
