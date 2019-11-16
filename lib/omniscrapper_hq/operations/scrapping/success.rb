require './lib/omniscrapper_hq/operations/scrapping/finish'

module Operations
  module Scrapping
    # Creates a successful scrapping result record
    class Success < Finish
      private

      def event_type
        'success'
      end
    end
  end
end
