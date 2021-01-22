FROM node:erbium-alpine

WORKDIR /usr/src/app

COPY package.json ./

RUN npm i

COPY . . 

RUN npm build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/src/app/build /usr/share/nginx/html
