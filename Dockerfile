FROM node:erbium-alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm i

COPY . . 

RUN npm build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
