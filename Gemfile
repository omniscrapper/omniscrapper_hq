source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'pg'
gem 'haml'
gem 'sass', '~> 3.4', '>= 3.4.22'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'rubocop'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'factory_bot'
end

group :production do
  # gem 'puma'
end
