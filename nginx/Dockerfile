


# Stage 1 - the build process
FROM node:14 as build-deps
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json .
RUN npm i

ADD . /usr/src/app
COPY ./src/config_prod.ts ./src/config.ts

#RUN npm install -g npm@7.9.0

#RUN mv /usr/src/app/src/config_prod.js /usr/src/app/src/config.js

RUN npm run build

# Stage 2 - the production environment
FROM nginx:alpine
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]