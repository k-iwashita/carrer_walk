FROM ruby:2.5
RUN apt-get update && apt-get install -y curl apt-transport-https wget 
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
      && apt-get install -y nodejs

RUN mkdir /careerWalk
WORKDIR /careerWalk

ADD Gemfile /careerWalk/Gemfile
ADD Gemfile.lock /careerWalk/Gemfile.lock
RUN bundle install
ADD . /careerWalk
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
RUN mkdir -p tmp/sockets
