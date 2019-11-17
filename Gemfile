source 'https://rubygems.org'

# NOTICE: quite often you need to use local copy of gem, which is mounted by path for some debugging.
# Almost always I forget to change it back to github version when I commit code.
# This thing allows to use local version whenever USE_LOCAL_GEMS variable is defined.
def try_local(gem_name)
  if ENV['USE_LOCAL_GEMS']
    gem gem_name, path: "../#{gem_name}"
  else
    gem gem_name, github: "omniscrapper/#{gem_name}"
  end
end

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
gem 'graphql-client'

gem 'json-schema'
gem 'pagy', '~> 3.6.0'

# Omniscrapper gems
try_local 'omni_scrapper'

# TODO: Latest dry-types from output gem is not compatible
# with dry-types version used by hanami.
#try_local 'omniscrapper_output'

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

gem 'simplecov', require: false, group: :test
