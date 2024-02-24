MAINTAINER aleksey.martynenko
FROM alpine:latest
# - update system and install nginx
RUN apk update \
    && apk add nginx \
    && adduser -D -u 1000 -g 'www' www \
    && mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www \
    && rm -rf /etc/nginx/nginx.conf
# - definition timezone
ENV TIMEZONE="Europe/Moscow"
# - set correct for me timezone
RUN rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone
# - copy `local` nginx.conf to docker image
COPY nginx.conf /etc/nginx/nginx.conf
# - copy helloworld.html page to docker image
COPY helloworld.html /www/helloworld.html
# - copy run `application` to docker image
COPY run.sh /run.sh
# - change execute bit `run.sh`
RUN chmod +x /run.sh
# - definition entrypoint
CMD ["/run.sh"]

