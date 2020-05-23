from ruby:2.6.6

RUN useradd -m -s /bin/bash app
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

#COPY Gemfile Gemfile.lock /app/
#RUN bundle install

#RUN chown app -R /app \
#  && chown app -R /usr/local/bundle
USER app
