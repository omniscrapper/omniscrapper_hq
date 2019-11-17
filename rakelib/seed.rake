require './config/boot'

namespace :db do
  desc 'Fills the database with sample data'
  task :seed do
    require_relative 'seeds'
    Seeds.new.call
  end

  desc 'Add hackernews task'
  task :seed_hackernews do
    require_relative 'hackernews_seeds'
    HackernewsSeeds.new.call
  end
end
