#!/bin/bash

echo "Running Release Tasks"

echo "Running Migrations"
bundle exec rails db:migrate

echo "Done"
