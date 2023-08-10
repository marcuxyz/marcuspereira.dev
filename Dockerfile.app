FROM ruby:3.2.0

ENV BUNDLER_VERSION 2.4.15

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends build-essential imagemagick

WORKDIR /app

COPY ../Gemfile ../Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-p", "3000"]
