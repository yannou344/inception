𝘛𝘩𝘪𝘴 𝘱𝘳𝘰𝘫𝘦𝘤𝘵 𝘩𝘢𝘴 𝘣𝘦𝘦𝘯 𝘤𝘳𝘦𝘢𝘵𝘦𝘥 𝘢𝘴 𝘱𝘢𝘳𝘵 𝘰𝘧 𝘵𝘩𝘦 42 𝘤𝘶𝘳𝘳𝘪𝘤𝘶𝘭𝘶𝘮 𝘣𝘺 𝘺𝘳𝘰𝘢𝘳𝘥

Description :

    Inception project helps the student to understand the interest of containers
    when deploying a solution and especially Docker and Docker compose tools. 
    Thanks to this project, the student will be able to :
        1. create different containers: 
        - a database: Mariadb, 
        - a server: Nginx,
        - a website: WordPress
        2. link them with Docker compose
        3. use the volumes

clearly presents the project, including its goal and a
brief overview.

Project description :
    Once a program has been created and passed all the tests, developer are 
    confronted to missing dependencies or OS issues when installing it on 
    another computer. Thanks to Docker, these burdens are removed! 
    Docker is indeed a tool designed to make it easier to create, deploy,
    and run applications by using containers.

    ◦ Virtual Machines vs Docker
        Docker containers are lightweight alternatives to Virtual Machines
        and it uses the host OS without pre-allocating any RAM.
        However Docker are limited to Linux host whereas VM are not limited to.
        VM are isolated from hardware.

    ◦ Secrets vs Environment Variables
    
    ◦ Docker Network vs Host Network

    ◦ Docker Volumes vs Bind Mounts

Instructions :

containing any relevant information about compilation,
installation, and/or execution.
On nginx terminal run:
/Bureau/Ecole_42/PROJETS/COMMON_CORE/commonCore05/core05-inception/srcs/requirements/nginx$ docker build -t nginx .
docker run -it -p 443:443 nginx
Then in another terminal: "docker ps" command gives:
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                     NAMES
c95070b46b8c   nginx     "nginx -g 'daemon of…"   3 seconds ago   Up 3 seconds   0.0.0.0:443->443/tcp, [::]:443->443/tcp   elated_shtern
"openssl s_client -connect localhost:443 -tls1_2"
gives:
"CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 C = FR, ST = PACA, L = Nice, O = 42, CN = login.42.fr
verify error:num=18:self-signed certificate
verify return:1
depth=0 C = FR, ST = PACA, L = Nice, O = 42, CN = login.42.fr
verify return:1
---
Certificate chain
0 s:C = FR, ST = PACA, L = Nice, O = 42, CN = login.42.fr
i:C = FR, ST = PACA, L = Nice, O = 42, CN = login.42.fr
a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256
v:NotBefore: Mar  5 17:23:20 2026 GMT; NotAfter: Apr  4 17:23:20 2026 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIDfTCCAmWgAwIBAgIUDlC6a48yx3qyWLQ/F8m/MJTSySkwDQYJKoZIhvcNAQEL
BQAwTjELMAkGA1UEBhMCRlIxDTALBgNVBAgMBFBBQ0ExDTALBgNVBAcMBE5pY2Ux
CzAJBgNVBAoMAjQyMRQwEgYDVQQDDAtsb2dpbi40Mi5mcjAeFw0yNjAzMDUxNzIz
MjBaFw0yNjA0MDQxNzIzMjBaME4xCzAJBgNVBAYTAkZSMQ0wCwYDVQQIDARQQUNB
MQ0wCwYDVQQHDAROaWNlMQswCQYDVQQKDAI0MjEUMBIGA1UEAwwLbG9naW4uNDIu
ZnIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrm6pxaXzlq+w+ydiF
Qwhg0sLJMEGkCQhjBJ8V+NzpZ+UMnMRv4wPZ9N8ISzhIafeUU884iuiryGArvgrj
DW+H7FWYvabzq+OnlhqoCW3N6SWyMyQgjmmF+O0UAMxfHwdHCOkcThwwITTSKh1A
bP5LwTjyk6ZxokzgzHB+/JjHwdiuu6HYHpYglON9MDCJNd+4Ix8ZTl8sZFqr70eO
pYKFwWHlJLEWdm0ax9A0ZDXZfdiL77w1HI2Z73WgX5yCxPBT1aga7eFEVS3J6Sp2
ZzkxSezsjm8JSPK8iFdyXZpIGRDi/7CFJrrj6EO9ADYTA4LKtrxz6JiJJOPdxiNs
1Rr9AgMBAAGjUzBRMB0GA1UdDgQWBBS9sySzhYt2MrkHnNlrHtzFnIPo0DAfBgNV
HSMEGDAWgBS9sySzhYt2MrkHnNlrHtzFnIPo0DAPBgNVHRMBAf8EBTADAQH/MA0G
CSqGSIb3DQEBCwUAA4IBAQCkgXONv001/3IoLkX+jUCY7kzAAho+EitQzRzRuelK
9B6cgOco8caFjMMultpMRymfo0fKzMlyyO/OrJwdmbzvWsPY/RPIobNWh9uGuL/O
5YmOR84YfAQOgstdrLrc1X/0Lwa9rOSuqABmTX/zWVU8zCwXBY3i2YBnLu2qpglG
DGfRvJT4qH3g9RgMsf+Br3N98URHhfsvdGhwrW63bUMlbgA2ki1hC9hq+rwGssxY
bmqip7btnnIfdBmvvrcjfhUDOA+7K+mq/P2mNHOHRtGPju2itdAjsjuW6c6c4JsK
/CDyW0d6QcJLZZ+KWq1yx/YL4CPFadq1Dsft6V5sT7QK
-----END CERTIFICATE-----
subject=C = FR, ST = PACA, L = Nice, O = 42, CN = login.42.fr
issuer=C = FR, ST = PACA, L = Nice, O = 42, CN = login.42.fr
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 1375 bytes and written 281 bytes
Verification error: self-signed certificate
---
New, TLSv1.2, Cipher is ECDHE-RSA-AES256-GCM-SHA384
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
Protocol  : TLSv1.2
Cipher    : ECDHE-RSA-AES256-GCM-SHA384
Session-ID: 300AEAF8985C0700F1E54B436F9EAB1BA808B240B3151EF2D28B5AD29FF12A5A
Session-ID-ctx:
Master-Key: EF59A079532CC54471F559417D55BFFE4AE07D371010BD8D166739516EEBE07F8FA821999A635FA7BC70DA1810AC4214
PSK identity: None
PSK identity hint: None
SRP username: None
Start Time: 1772891935
Timeout   : 7200 (sec)
Verify return code: 18 (self-signed certificate)
Extended master secret: yes
---
closed"





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

AI used:
https:://aistudio.google.com/
prompt: "I am a 42 student and I would like you guide me to the solution giving examples or websites to dig on
features I need to understand and apply in the current project. Caution: I don't want you give me the code solution."
Parts of the project used with AI:
- readme
- secrets, CA meaning (certificate authenticity)
- docker installation
- nginx container creation
- mariaDB database creation
- makefile creation


	
