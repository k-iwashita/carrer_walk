FROM nginx:latest
RUN rm -f /etc/nginx/conf.d/*
COPY default.template /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
