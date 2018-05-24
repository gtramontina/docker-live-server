FROM node:9.11.1-alpine@sha256:91d8397253ab507f0fbd0ca5b1a423c5a5f011b07650719dc28d1d5484cf031c

ENV NODE_PATH=${NODE_PATH}:/opt/npm.global
ENV PATH=${PATH}:/opt/npm.global/.bin

WORKDIR /opt
COPY package.json yarn.lock ./
RUN yarn --prod && \
    yarn autoclean --init && \
    yarn autoclean --force && \
    mv node_modules npm.global && \
    rm package.json yarn.lock .yarnclean

WORKDIR /app

ENTRYPOINT ["live-server", "--no-browser"]
