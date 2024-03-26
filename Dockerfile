FROM node:19-alpine
LABEL maintainer="totalplatform <info@totaljs.com>"

WORKDIR /www

COPY index.js .
COPY config .
COPY package.json .
COPY --from=builder /app/bundles/app.bundle ./bundles/
COPY --from=builder /app/bundles/admin.bundle ./bundles/

RUN npm install --production

EXPOSE 8000

CMD [ "npm", "start" ]
