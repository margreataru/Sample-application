FROM nginx:latest 
MAINTAINER mavrick202@gmail.com 
RUN sudo apt update 2>/dev/null | grep packages | cut -d '.' -f 1
RUN apt install -y curl
COPY index.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
#HEALTHCHECK CMD curl --fail http://localhost || exit 1
CMD ["nginx", "-g", "daemon off;"]
