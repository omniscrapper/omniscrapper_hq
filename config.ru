require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

require './config/environment'
require 'sidekiq/web'

Sidekiq::Web.set :session_secret, 'session_secret'

map '/sidekiq' do
  run Sidekiq::Web
end

use Prometheus::Middleware::Collector
use Prometheus::Middleware::Exporter
run Hanami.app
