FROM ruby:3.3.0-alpine

RUN apk update && apk add postgresql-client postgresql-dev build-base libxml2-dev libxslt-dev

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler

RUN bundle install

COPY . /app

# Copy entrypoint.sh and make it executable
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

# Set entrypoint.sh as the ENTRYPOINT
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
