source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'

gem 'hanami-model', '~> 1.3'
gem 'pg'

gem 'sass', '~> 3.4', '>= 3.4.22'
gem 'bootstrap', '~> 4.3.1'
gem 'haml'

gem 'dry-system', '~> 0.9.0'
gem 'dry-system-hanami', github: 'davydovanton/dry-system-hanami'
gem 'dry-monads', '~> 1.1.0'
gem 'dry-validation'

gem 'graphql'
gem 'sidekiq'

gem 'json-schema'
gem 'omni_scrapper'
gem 'pagy', '~> 3.6.0'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'rubocop'
  gem 'hanami-fabrication'
  gem 'pry', '~> 0.12.2'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  gem 'puma'
end
