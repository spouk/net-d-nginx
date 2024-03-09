FROM nginx
LABEL version=$VERSION
LABEL maintainer="aleksey martynenko"
# - copy `local` nginx.conf to docker image
COPY nginx.conf /etc/nginx/nginx.conf
# - copy helloworld.html page to docker image
COPY helloworld.html /helloworld.html
