module Scrapping
  class StartEventRepository < Hanami::Repository
    self.relation = :scrapping_started_events

  end
end
