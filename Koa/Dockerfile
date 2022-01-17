FROM node:16.13.2-alpine3.14

ENV PATH=$PATH:/root/.yarn-global/bin

# yarn check & set
RUN yarn --version \
&&	yarn config set prefix "/root/.yarn-global"

# typescript install
RUN yarn global add typescript \
&&	yarn global add ts-node \
&&	yarn global add nodemon

# koa install
RUN yarn global add koa \
&&	yarn global add koa-router \
&&	yarn global add koa-bodyparser

# koa typescript typing info
RUN yarn global add @types/koa \
&&	yarn global add @types/koa-router \
&&	yarn global add @types/koa-bodyparser

# Default Port Expose
EXPOSE 3000

CMD ["/bin/ash"]