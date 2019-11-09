#!/bin/bash
cd /app
bundle exec hanami db migrate
foreman start
