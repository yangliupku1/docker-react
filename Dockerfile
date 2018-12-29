# build the app
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# serve nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
