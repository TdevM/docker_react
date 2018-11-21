
# Multi step build process.
# Dev Build Phase.
# Term this as builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Result of build phase copy to run phase. everything from build phase gets dropped.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
