FROM ruby:2.5.1
ENV SRCPATH /usr/src/app
WORKDIR $SRCPATH
EXPOSE 3000

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev git-core libxslt-dev libgmp3-dev ruby-dev zlib1g-dev liblzma-dev curl libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs

COPY config/database.yml.example config/database.yml
COPY config/secrets.yml.example config/secrets.yml
ADD Gemfile $SRCPATH/Gemfile
ADD Gemfile.lock $SRCPATH/Gemfile.lock

RUN bundle install
COPY . $SRCPATH
CMD [ "bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0" ]
