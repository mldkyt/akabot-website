FROM node:22-alpine AS build

WORKDIR /build

COPY . .

RUN npm i
RUN npm run build

FROM nginx:alpine AS run

COPY --from=build /build/dist/ /var/www/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
