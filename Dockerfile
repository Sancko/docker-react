FROM node:alpine

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . . 

RUN npm build

FROM nginx

COPY --from=0 usr/src/app/build usr/share/nginx/html
EXPOSE 80