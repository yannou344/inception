FROM alpine:3.22

RUN apk update  \
    && apk add mariadb mariadb-client

#RUN addgroup -S mariadb && adduser -S appuser -G appgroup

#ENTRYPOINT ["/bin/sh"]
COPY conf/mariaDB.conf	/etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /run/mysqld && \
      chown -R mysql:mysql /run/mysqld
COPY --chmod=+x mdb-setup.sh /
ENTRYPOINT [ "sh", "/mdb-setup.sh" ]
#RUN service mysql start;
#RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#RUN mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#RUN mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#RUN mysql -e "FLUSH PRIVILEGES;"
#RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
#RUN exec mysqld_safe

