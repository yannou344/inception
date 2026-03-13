FROM alpine:3.22

RUN apk update  \
    && apk add mariadb mariadb-client

COPY conf/mariadb.conf	/etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /run/mysqld && \
      chown -R mysql:mysql /run/mysqld
COPY --chmod=+x tools/mdb-setup.sh /tools/mdb-setup.sh
ENTRYPOINT [ "sh", "/tools/mdb-setup.sh" ]

