FROM tooljet/tooljetce

# Fix for JS heap limit allocation issue
# ENV NODE_OPTIONS="--max-old-space-size=4096"

# RUN npm i -g npm@7.20.0
# RUN mkdir -p /app

# WORKDIR /app

ENV TOOLJET_HOST=http://localhost:8001
ENV LOCKBOX_MASTER_KEY=0000000000000000000000000000000000000000000000000000000000000000
ENV SECRET_KEY_BASE=replace_with_secret_key_base

## Configure a hostname for the server
ENV SERVER_HOST=localhost:3000

# DATABASE CONFIG
ENV ORM_LOGGING=
ENV PG_DB=railway
ENV PG_USER=postgres
ENV PG_PORT=7479
ENV PG_HOST=containers-us-west-60.railway.app
ENV PG_PASS=BAij4Rihicf8uoKQkHAL

# Checks every 24 hours to see if a new version of ToolJet is available
# (Enabled by default. Set 0 to disable)
ENV CHECK_FOR_UPDATES=0

# Checks every 24 hours to update app telemetry data to ToolJet hub.
# (Telemetry is enabled by default. Set value to true to disable.)
# DISABLE_APP_TELEMETRY=false

ENV GOOGLE_CLIENT_ID=
ENV GOOGLE_CLIENT_SECRET=

# EMAIL CONFIGURATION
ENV DEFAULT_FROM_EMAIL=hicous@fastmail.com
ENV SMTP_USERNAME=hicous@fastmail.com
ENV SMTP_PASSWORD=2r8ygf6nh4pkssyy
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

