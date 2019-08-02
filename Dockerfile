FROM node:9-alpine
ENV NAME="Leonardo Maciel"
MAINTAINER "Leonardo Maciel"
WORKDIR /src
COPY app/ .
RUN npm install --quiet
EXPOSE 3000
CMD npm start