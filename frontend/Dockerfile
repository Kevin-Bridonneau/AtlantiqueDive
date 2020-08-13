# base image
FROM node

ARG user
ARG uid

ADD . /app

WORKDIR /app

RUN npm install
RUN npm install @vue/cli@3.7.0 -g

CMD npm run serve