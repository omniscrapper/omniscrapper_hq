# OmniScrapper HQ

[![CircleCI](https://circleci.com/gh/omniscrapper/omniscrapper_hq/tree/master.svg?style=svg)](https://circleci.com/gh/omniscrapper/omniscrapper_hq/tree/master)

<img src="https://i.imgur.com/8r3Sb82.png" width="300" height="300">

Web application for OmniScrapper management.

It main goal is to provide:

* Ability to define scrappers in UI
* Ability to test defined scrappers from UI
* Ability to schedule scrapping schedule

## Setup

### Demo
If you want just to see how the application works, you can use dockerized setup to start project with a single command.

Just run `docker-compose up` in the directory of project, and they visit [localhost:2300](http://localhost:2300).

### Start

* Copy env variables `cp .env.development.sample .env.development`
* Run `make db-prepare` it  will create db, run migrations and fill database with data
* To start the server run `make server`

### Seeds

Run `rake db:seed` to fill the database with sample data ready for testing.

It will add one real site, schema and task for scrapping. Feel free to go to tasks page and run sample scrapping.
