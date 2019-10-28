source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'sass', '~> 3.4', '>= 3.4.22'
gem 'bootstrap', '~> 4.3.1'
gem 'haml'
gem 'json-schema'
gem 'sidekiq'
gem 'omni_scrapper', path: '../omni_scrapper'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
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
  # gem 'puma'
end
