#!/bin/bash
cd /app
bundle exec hanami db migrate
rake db:seed_hackernews
foreman start
