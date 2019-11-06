FROM ruby:2.6
MAINTAINER Stanislav Mekhonoshin <ejabberd@gmail.com>

WORKDIR /app

ENV RACK_ENV=production
ENV HANAMI_ENV=production
RUN gem install foreman bundler

COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app/
RUN hanami assets precompile

EXPOSE 2300

ENTRYPOINT ["/app/entrypoint.sh"]
