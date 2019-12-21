require './lib/omniscrapper_hq/operations/scrapping/finish'

module Operations
  module Scrapping
    # Creates a failed scrapping result record
    class Failure < Finish
      private

      def hook
        Monitoring::PAGE_SCRAPPINGS_TOTAL.increment(labels: { event: event_type })
        Monitoring::LAST_PAGE_SCRAPPING_DATE.set(Time.now.to_i)
      end

      def event_type
        'failure'
      end
    end
  end
end
