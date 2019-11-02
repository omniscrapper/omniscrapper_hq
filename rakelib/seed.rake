require './config/boot'

namespace :db do
  desc 'Fills the database with sample data'
  task :seed do
    require_relative 'seeds'
    Seeds.new.call
  end
end
