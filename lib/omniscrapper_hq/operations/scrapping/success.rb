require './lib/omniscrapper_hq/operations/scrapping/finish'

module Operations
  module Scrapping
    # Creates a successful scrapping result record
    class Success < Finish
      private

      def hook
        Monitoring::SUCCESSFUL_PAGE_SCRAPPINGS_TOTAL.increment
      end

      def event_type
        'success'
      end
    end
  end
end
