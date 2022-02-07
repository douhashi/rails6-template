FROM ruby:2.7.5-slim

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
ENV ROOT=/app \
    GEM_HOME=/bundle \
    BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm vim-nox

RUN mkdir /app

WORKDIR $ROOT

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# yarn
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN npm install -g yarn
RUN yarn install

# Bundle
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4
RUN rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/*

COPY . $ROOT

EXPOSE 5000
EXPOSE 3036


