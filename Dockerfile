FROM node:16.13.0-alpine3.14

LABEL version="1.0" \
      maintainer="fatal.error.27@gmail.com"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

ENV NODE_ENV=development

WORKDIR /app

RUN npm install -g npm@8.1.4 \
    npm audit fix

CMD [ "npm" ]