# build environment
ENV WORKSPACE="/rosa/app/source/"
ENV PATH $WORKSPACE/node_modules/.bin:$PATH

FROM node:13.12.0-alpine as build

WORKDIR $WORKSPACE

COPY package.json ./
COPY package-lock.json ./

RUN npm ci --silent
RUN npm install react-scripts@3.4.1 -g --silent

COPY . ./

RUN npm run build

# production environment
FROM nginx:stable-alpine

COPY --from=build $WORKSPACE/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
