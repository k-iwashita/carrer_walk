FROM ruby:2.5
RUN apt-get update && apt-get install -y curl apt-transport-https wget 
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

RUN mkdir -p tmp/sockets
