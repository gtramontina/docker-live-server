FROM node:9.11.1-alpine@sha256:991c1808b9702a34e4eb04092065e968e70b6a7f190a63192daf35c31e4c14af

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
