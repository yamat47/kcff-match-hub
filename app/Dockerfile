FROM ruby:3.3.0-alpine

RUN apk update && apk add postgresql-client postgresql-dev build-base libxml2-dev libxslt-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler

RUN bundle install

COPY . /app

EXPOSE 3000