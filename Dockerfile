FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install 
COPY . . 
RUN npm run build
# CMD ["npm", "run", "start"]
# docker run -p 3000:3000 -i 33f6d8cf35cd

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html