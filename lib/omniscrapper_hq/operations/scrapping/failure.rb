require './lib/omniscrapper_hq/operations/scrapping/finish'

module Operations
  module Scrapping
    # Creates a failed scrapping result record
    class Failure < Finish
      private

      def hook
        Monitoring::FAILED_PAGE_SCRAPPINGS_TOTAL.increment
      end

      def event_type
        'failure'
      end
    end
  end
end
