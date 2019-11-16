require './lib/omniscrapper_hq/operations/base'

module Operations
  module Scrapping
    # Base class for operations managing scrapping finished events
    class Start < ::Operations::Base
      include Import[
        start_repo: 'repositories.scrapping.start_event'
      ]

      def call(attributes = {})
        # TODO: validate incoming attributes at Start and Finish operations
        start_repo.create(attributes.to_h)
      end
    end
  end
end
