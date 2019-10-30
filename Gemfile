# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'rake'

gem 'bootstrap', '~> 4.3.1'
gem 'haml'
gem 'json-schema'
gem 'omni_scrapper', path: '../omni_scrapper'
gem 'pg'
gem 'sass', '~> 3.4', '>= 3.4.22'
gem 'sidekiq'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'hanami-webconsole'
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'hanami-fabrication'
  gem 'pry', '~> 0.12.2'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :production do
  # gem 'puma'
end
