ARG BASE_IMAGE_TAG=lts-alpine
FROM node:${BASE_IMAGE_TAG}

USER node
WORKDIR /home/node

ARG ENV
ENV NODE_ENV ${ENV}

COPY --chown=node package.json package-lock.json ./

RUN npm install

COPY --chown=node . .

ARG PORT=8080
ENV PORT ${PORT}
EXPOSE ${PORT}

ENTRYPOINT ["./entrypoint"]