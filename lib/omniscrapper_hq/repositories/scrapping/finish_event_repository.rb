module Scrapping
  class FinishEventRepository < Hanami::Repository
    self.relation = :scrapping_finished_events
  end
end
