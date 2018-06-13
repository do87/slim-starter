FROM nginx:1.15-alpine

COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

ADD ./api /app

EXPOSE 80
