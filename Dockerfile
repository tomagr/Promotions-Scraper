FROM ruby:3.0.1
WORKDIR /usr/src/scraper

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ADD Gemfile $SRCPATH/Gemfile

#ADD Gemfile.lock $SRCPATH/Gemfile.lock

RUN bundle install
COPY . $SRCPATH
EXPOSE 3000

CMD [ "bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0" ]
