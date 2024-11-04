FROM node:20 AS install
WORKDIR /app
COPY ./infrastructure-interview-test-main /app
RUN yarn install

FROM node:20-alpine
WORKDIR /app
COPY --from=install /app /app
EXPOSE 3000
ENTRYPOINT [ "yarn", "start" ]