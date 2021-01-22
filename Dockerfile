FROM node:alpine

WORKDIR /usr/app

COPY package.json ./

RUN npm install

COPY . . 

RUN npm build

FROM nginx

COPY --from=0 /usr/app/build /usr/share/nginx/html

EXPOSE 80