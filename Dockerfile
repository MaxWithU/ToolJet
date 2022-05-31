FROM tooljet/tooljet-ce
# FROM tooljet/tooljet-client-ce:latest
# RUN node -v
# Create .env from this example file and replace values for the environment.
# The application expects a separate .env.test for test environment configuration
# Get detailed information about each variable here: https://docs.tooljet.com/docs/setup/env-vars

ENV TOOLJET_HOST=http://localhost:8001
ENV LOCKBOX_MASTER_KEY=0000000000000000000000000000000000000000000000000000000000000000
ENV SECRET_KEY_BASE=replace_with_secret_key_base

## Configure a hostname for the server
ENV SERVER_HOST=localhost:3000

# DATABASE CONFIG
ENV ORM_LOGGING=
ENV PG_DB=railway
ENV PG_USER=postgres
ENV PG_PORT=7787
ENV PG_HOST=containers-us-west-37.railway.app
ENV PG_PASS=OO0Ot7SxUaDCcyVTbze0

# Checks every 24 hours to see if a new version of ToolJet is available
# (Enabled by default. Set 0 to disable)
ENV CHECK_FOR_UPDATES=0

# Checks every 24 hours to update app telemetry data to ToolJet hub.
# (Telemetry is enabled by default. Set value to true to disable.)
# DISABLE_APP_TELEMETRY=false

ENV GOOGLE_CLIENT_ID=
ENV GOOGLE_CLIENT_SECRET=

# EMAIL CONFIGURATION
ENV DEFAULT_FROM_EMAIL=hello@fastmail.com
ENV SMTP_USERNAME=hicous@fastmail.com
ENV SMTP_PASSWORD=V5q7iG$ssE5PdZ4
ENV SMTP_DOMAIN=smtp.fastmail.com	
ENV SMTP_PORT=465


# DISABLE USER SIGNUPS (true or false). only applicable if Multi-Workspace feature is enabled
# ENV DISABLE_SIGNUPS=true
# Disable Multi-Workspace features (true or false)
# ENV DISABLE_MULTI_WORKSPACE=true

# OBSERVABILITY
ENV APM_VENDOR=
ENV SENTRY_DNS=
ENV SENTRY_DEBUG=

# FEATURE TOGGLE
ENV COMMENT_FEATURE_ENABLE=
ENV  ENABLE_MULTIPLAYER_EDITING=true

ENV NODE_ENV=production

CMD npm run start:prod
# # # Fix for JS heap limit allocation issue
# # ENV NODE_OPTIONS="--max-old-space-size=4096"

# # RUN npm i -g npm@7.20.0
# # RUN mkdir -p /app

# # WORKDIR /app

# # # Scripts for building
# COPY ./package.json ./package.json

# # # Build plugins
# COPY ./plugins/package.json ./plugins/package-lock.json ./plugins/
# RUN npm --prefix plugins install
# COPY ./plugins/ ./plugins/

# # ENV NODE_ENV=production
# RUN npm --prefix plugins run build
# RUN npm --prefix plugins prune --production

# # # Build frontend
# # COPY ./frontend/package.json ./frontend/package-lock.json ./frontend/
# # RUN npm --prefix frontend install
# # COPY ./frontend/ ./frontend/

# # RUN npm --prefix frontend run build

# # # Build server
# COPY ./server/package.json ./server/package-lock.json ./server/
# RUN npm --prefix server install
# COPY ./server/ ./server/
# # RUN npm install -g @nestjs/cli
# # RUN npm --prefix server run build

# # FROM node:14.17.3-buster

# ENV NODE_ENV=production
# ENV NODE_OPTIONS="--max-old-space-size=4096"
# RUN apt-get update && apt-get install -y postgresql-client freetds-dev libaio1 wget

# # Install Instantclient Basic Light Oracle and Dependencies
# WORKDIR /opt/oracle
# RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
#     unzip instantclient-basiclite-linuxx64.zip && rm -f instantclient-basiclite-linuxx64.zip && \
#     cd /opt/oracle/instantclient* && rm -f *jdbc* *occi* *mysql* *mql1* *ipc1* *jar uidrvci genezi adrci && \
#     echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && ldconfig
# WORKDIR /

# RUN mkdir -p /app

# # copy npm scripts
# COPY --from=builder /app/package.json ./app/package.json
# # copy plugins dependencies
# COPY --from=builder /app/plugins/dist ./app/plugins/dist
# COPY --from=builder /app/plugins/client.js ./app/plugins/client.js
# COPY --from=builder /app/plugins/node_modules ./app/plugins/node_modules
# COPY --from=builder /app/plugins/packages/common ./app/plugins/packages/common
# COPY --from=builder /app/plugins/package.json ./app/plugins/package.json
# # copy frontend build
# # COPY --from=builder /app/frontend/build ./app/frontend/build
# # copy server build
# # NOTE: typescript dependency on /server/scripts and typeorm for db creation and migration.
# # Need to check if we can optimize such that only executable dist from prev stage can be copied
# COPY --from=builder /app/server ./app/server
# COPY ./.env  ./app/.env
# WORKDIR /app
# RUN npm install pm2 -g
# # COPY ./frontend/config ./frontend/config
# # RUN ls /app/frontend/config
# CMD CMD openresty -g "daemon off;" && node start server/dist/src/main.js 

# # ENTRYPOINT ["./frontend/config/entrypoint.sh"]
