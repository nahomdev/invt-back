FROM node:lts-alpine3.9

WORKDIR /usr/src/app

RUN mkdir docker-uploads

ARG EXPRESS_PORT
EXPOSE ${EXPRESS_PORT}

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then yarn install; \
        else yarn install --only=production; \
        fi

RUN apk add yarn

COPY package.json yarn.lock ./

RUN yarn install

COPY server.js .

COPY express ./express/

CMD ["node", "server.js"]