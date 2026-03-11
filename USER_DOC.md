USER DOCUMENTATION

1. Overview of Services

    NGINX: The "Gatekeeper." It acts as the entry point, providing security via TLS 1.2/1.3 and serving the website over HTTPS (Port 443).

    WordPress (PHP-FPM): The "Engine." It processes the PHP code for the website and manages the content.

    MariaDB: The "Vault." A relational database that securely stores all WordPress data (posts, users, settings).


2. Getting Started (Start & Stop)

    Prerequisite: 
    In a terminal, make "sudo echo "127.0.0.1 yroard.42.fr" >> /etc/hosts" to map the domain

    Thanks to Makefile: In a terminal, at the root of the project, make the following commands:
        "make" to start the stack(images are built, volumes/networks are created, and starts services).

        "make down" to stop the stack(containers and networks are removed) or make stop (container objects remain on the disk in a Exited state). Differences can be seen thanks to command "docker ps -a"

        "make re" to full Reset(everything is removed, even the data placed in bind mounts, and all is restarted from scratch, out of the passwords and SSL certificated).

        "make cleanSecrets" to remove the current passwords and SSL certificates.
    

3. Accessing the Website

    Public Site: https://yroard.42.fr (Mention the SSL warning is normal for self-signed certificates).

    Admin Dashboard: https://yroard.42.fr/wp-admin (Where the administrator manages content).


4. Credential Management

    Location: into ./secrets/ directory on the host machine.

    Files:  mariadb_password.txt
            mariadb_root_password.txt 
            wp_password.txt
            wp_root_password.txt

    Security Note: these files should never be committed to a public repository.

    Modification: Tell the user that if they want to change a password, they should edit the file in ./secrets/ and run make down and make up to take this change into account.

5. Service Verification (Health Checks)

    Once accessed to website(https://yroard.42.fr), we can check the following:

    Status Check: Use "docker ps". All three containers should show Up status.

    Logging: Use "make logs". This allows real-time monitoring of traffic and errors.

    Network Check: using "curl -I https://yroard.42.fr" should give a "200 OK" response ; it proves Nginx and WordPress are communicating.

    Security Check: thanks to "openssl s_client -connect localhost:443 -tls1_2", we can check the TLS version.