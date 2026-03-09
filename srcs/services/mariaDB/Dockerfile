FROM alpine:3.22

RUN apk update  \
    && apk add mariadb mariadb-client

COPY conf/mariaDB.conf	/etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /run/mysqld && \
      chown -R mysql:mysql /run/mysqld
COPY --chmod=+x mdb-setup.sh /
ENTRYPOINT [ "sh", "/mdb-setup.sh" ]

