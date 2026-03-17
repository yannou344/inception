FROM alpine:3.22

RUN apk update && apk add --no-cache nginx

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /var/www/static_website
RUN chmod 755 /var/www/static_website
RUN chown -R nginx:nginx /var/www/static_website

COPY tools/alps /var/www/static_website/alps

CMD [ "nginx", "-g", "daemon off;" ]