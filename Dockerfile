FROM node:20.12.0-alpine@sha256:ce6596fb57e9c3c126a93add6a52f661298e17f0be51ef08cf6e1788213a9c9b

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
