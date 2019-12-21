require './lib/omniscrapper_hq/operations/base'

module Operations
  module Scrapping
    # Base class for operations managing scrapping finished events
    class Finish < ::Operations::Base
      include Import[
        finish_repo: 'repositories.scrapping.finish_event'
      ]

      def call(attributes = {})
        hook
        attributes = attributes.to_h.merge(event_type: event_type)
        finish_repo.create(attributes)
      end

      private

      def hook
        # Can be overridden by child operation
      end

      def event_type
        raise NotImplementedError, 'implement #event_type in child class'
      end
    end
  end
end
