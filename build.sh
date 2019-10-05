#!/bin/sh
docker-compose build
docker-compose run web rake db:create
chown -R $USER:$USER .
docker-compose up
