FROM node:20.9.0

ARG FOUNDRY_VERSION=12.325 \
    FOUNDRY_DATA=/foundrydata

ENV FOUNDRY_VERSION=$FOUNDRY_VERSION \
    FOUNDRY_DATA=/foundrydata 

RUN mkdir /app

COPY FoundryVTT-${FOUNDRY_VERSION}}.zip /app

WORKDIR /app

RUN unzip FoundryVTT-${FOUNDRY_VERSION}}.zip && \
    rm FoundryVTT-${FOUNDRY_VERSION}

ENTRYPOINT [ "node", "resources/app/main.js", "${FOUNDRY_DATA}" ]
