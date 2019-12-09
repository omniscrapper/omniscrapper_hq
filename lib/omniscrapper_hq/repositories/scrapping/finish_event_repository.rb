require_relative '../shared/pagination'

module Scrapping
  class FinishEventRepository < Hanami::Repository
    include OmniscrapperHq::Repositories::Shared::Pagination

    self.relation = :scrapping_finished_events
  end
end
