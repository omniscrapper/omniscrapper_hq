require './lib/omniscrapper_hq/operations/scrapping/finish'

module Operations
  module Scrapping
    # Creates a successful scrapping result record
    class Success < Finish
      private

      def hook
        Monitoring::PAGE_SCRAPPINGS_TOTAL.increment(labels: { event: event_type })
        Monitoring::LAST_PAGE_SCRAPPING_DATE.set(Time.now.to_i)
      end

      def event_type
        'success'
      end
    end
  end
end
