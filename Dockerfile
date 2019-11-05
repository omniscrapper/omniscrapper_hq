FROM ruby:2.6
MAINTAINER Stanislav Mekhonoshin <ejabberd@gmail.com>

COPY . /app/
WORKDIR /app

ENV RACK_ENV=production
ENV HANAMI_ENV=production

RUN gem install foreman bundler
RUN bundle install
RUN hanami assets precompile

EXPOSE 2300

ENTRYPOINT ["/app/entrypoint.sh"]
