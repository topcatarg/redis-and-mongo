FROM alpine:3.7

RUN \
apk add --no-cache bash mongodb redis supervisor && \
rm /usr/bin/mongoperf

VOLUME /data/db
EXPOSE 27017 28017 6379

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]