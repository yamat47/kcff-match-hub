FROM ruby:3.3.4-alpine

RUN apk update && apk add postgresql-client postgresql-dev build-base libxml2-dev libxslt-dev gcompat

WORKDIR /app

COPY ../../app/Gemfile /app/Gemfile
COPY ../../app/Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY ../../app /app

COPY ../../environments/development/entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
