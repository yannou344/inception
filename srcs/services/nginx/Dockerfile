FROM alpine:3.22

RUN apk update && apk add --no-cache \
      nginx \
      vim \
      curl\
      openssl &&\
      mkdir -p /etc/nginx/ssl &&\
      mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/http.d/default.conf
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
RUN chown -R nginx:nginx /var/www/html

#Allows nginx to be launched in foreground
CMD [ "nginx", "-g", "daemon off;" ]
