FROM node:latest AS BASE1

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .


FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY --from=BASE /usr/src/app ./

EXPOSE 3000

CMD ["node", "index.js"]
