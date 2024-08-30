FROM node:22-alpine AS builder

RUN mkdir /home/node/app && \
	chown node:node -R /home/node

WORKDIR /home/node/app
USER node

COPY package.json package.json
RUN npm install

FROM builder AS dev

VOLUME /home/node/app

CMD ["npm", "run", "dev", "--", "--host"]
