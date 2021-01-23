FROM node:alpine AS build_intermidiate

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY . . 

RUN npm build --prod

FROM nginx:alpine
EXPOSE 80
COPY --from=build_intermidiate ./app/build /usr/share/nginx/html

