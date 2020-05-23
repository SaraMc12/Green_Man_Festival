from ruby:2.6.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn

RUN useradd -m -s /bin/bash app
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY package.json yarn.lock /app/
RUN yarn install

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app/

RUN chown app -R /app \
  && chown app -R /usr/local/bundle

USER app
