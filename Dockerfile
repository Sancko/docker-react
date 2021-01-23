FROM node:alpine

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY . ./ 

RUN npm build --prod

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
COPY --from=0 ./app/build ./usr/share/nginx/html

