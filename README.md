# Cloudinary Heroku Demo

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

Getting the `CLOUDINARY_URL` environmental variable.
https://devcenter.heroku.com/articles/cloudinary#using-with-ruby-on-rails - Covered here nicely

    heroku config -s | grep CLOUDINARY >> .env
