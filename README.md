# Cloudinary Heroku Demo

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

This demos a snippet of JavaScript that'll delay a forms submission to the server until all files have finished uploading.

I've also included a Carrierwave setup that worked for me (which also tags the uploads remotely), along with a fairly rudimentary test.

TODO: Describe what the repo covers, ideally:

1. Cloudinary Setup with some waiting JS
2. Also Carrierwave (with the tag system I thought was neat?)
3. Testing! How I tested uploads, and mocked them.

## Setting Up

Clone this app, add the heroku CLI.

### Heroku

Create the app and add the Cloudinary addon

    heroku create && heroku addons:create cloudinary:starter

### Local Environment

Copy the example files

    cp config/database.yml.example config/database.yml && cp .env.example .env

Setup the database

    bundle exec rails db:setup

Getting the `CLOUDINARY_URL` environmental variable.
https://devcenter.heroku.com/articles/cloudinary#using-with-ruby-on-rails - Covered here nicely

    heroku config -s | grep CLOUDINARY >> .env

## Running Tests

    bundle exec rails test
