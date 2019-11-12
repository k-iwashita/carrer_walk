#!/bin/sh
docker-compose build
docker-compose run web rake db:create
chown -R $USER:$USER .
docker-compose run web rails runner db/schema.rb
docker-compose run web rails runner lib/event.rb
docker-compose run web rails runner lib/internship.rb
docker-compose up
