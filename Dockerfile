FROM ruby:2.5
RUN apt-get update && apt-get install -y curl apt-transport-https wget 
RUN curl -SL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN curl -o- -L https://yarnpkg.com/install.sh | sh
RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
RUN mkdir -p tmp/sockets
