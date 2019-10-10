FROM nginx:latest
RUN rm -f /etc/nginx/conf.d/*
RUN rm -f /etc/nginx/log.txt
RUN touch /etc/nginx/log.txt
COPY default.template /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD echo date  >> /etc/nginx/log.txt
CMD echo   >> /etc/nginx/log.txt
CMD echo   >> /etc/nginx/log.txt
CMD echo   >> /etc/nginx/log.txt
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf >> /etc/nginx/log.txt
