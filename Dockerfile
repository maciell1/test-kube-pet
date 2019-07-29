FROM node:9-alpine
WORKDIR /src
MAINTAINER Leonardo Maciel
COPY app/ .
RUN npm install --quiet
EXPOSE 3001
CMD npm start

