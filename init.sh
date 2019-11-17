#!/bin/sh
docker-compose build
docker-compose run web rake db:create
echo Execute db/schema.rb ...
docker-compose run web rails runner db/schema.rb
echo Done!
echo Execute lib/event.rb ...
docker-compose run web rails runner lib/event.rb
echo Done!
echo Execute lib/internship.rb
docker-compose run web rails runner lib/internship.rb
echo Done!
chown -R $USER:$USER .
