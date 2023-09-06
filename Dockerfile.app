FROM ruby:3.2.0

ENV NODE_VERSION 18

RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends nodejs npm build-essential gnupg imagemagick

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-p", "3000"]
