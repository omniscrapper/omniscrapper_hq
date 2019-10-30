require './config/environment'
require 'sidekiq/web'

Sidekiq::Web.set :session_secret, 'session_secret'

map '/sidekiq' do
  run Sidekiq::Web
end

run Hanami.app
