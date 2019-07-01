require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative './initializers/inflectors'
require_relative '../lib/omniscrapper_hq'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/omniscrapper_hq_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/omniscrapper_hq_development'
    #    adapter :sql, 'mysql://localhost/omniscrapper_hq_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/omniscrapper_hq/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
