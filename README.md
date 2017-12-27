# Cloudinary Heroku Demo

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

This demos a [snippet of JavaScript](https://github.com/MikeRogers0/CloudinaryHerokuDemo/blob/master/app/assets/javascripts/components/cloudinary.js) that'll delay a forms submission to the server until all files have finished uploading.

I've also included a [Carrierwave setup](https://github.com/MikeRogers0/CloudinaryHerokuDemo/blob/master/app/uploaders/user/avatar_uploader.rb) that worked for me (which also adds tags the remote uploads), along with a fairly [rudimentary test](https://github.com/MikeRogers0/CloudinaryHerokuDemo/blob/master/test/system/users_test.rb).

## Setting Up

### Heroku

Create the app and add the Cloudinary addon

    heroku create && heroku addons:create cloudinary:starter

Adding the buildpacks for Heroku (So it installs JavaScript dependencies, then bundles)

    heroku buildpacks:set heroku/ruby && heroku buildpacks:add --index 1 heroku/nodejs

### Local Environment

Installing JavaScript dependencies (Via Yarn)

    brew install yarn && yarn

Copy the example database and environment files

    cp config/database.yml.example config/database.yml && cp .env.example .env

Setup the database

    bundle exec rails db:setup

Getting the `CLOUDINARY_URL` environmental variable (I'm assuming you've run the Heroku setup at this point)

    heroku config -s | grep CLOUDINARY >> .env

Turning on the server

    bundle exec rails s

## Running Tests

    bundle exec rails test
