FROM node:16.13.0-alpine3.14

LABEL version="0.1" \
      maintainer="fatal.error.27@gmail.com"

RUN apk update \
    && apk upgrade \
    && apk add --update\
        tzdata \
    && apk add --no-cache \
        bash

RUN rm -rf /var/cache/apk/*

ENV TZ=Europe/Berlin
ENV NODE_ENV=development

WORKDIR /app

RUN npm install -g npm@8.1.4
RUN npm install -g @nestjs/cli
RUN npm install --save hbs

CMD [ "sh" ]