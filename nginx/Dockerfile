FROM nginx:1.25-alpine

COPY etc/ /etc/nginx/
COPY docker-entrypoint.d/ /docker-entrypoint.d/

RUN apk add bash \
  && chmod -R 555 /docker-entrypoint.d/