require './lib/omniscrapper_hq/operations/scrapping/base'

module Operations
  module Scrapping
    # Creates a successful scrapping result record
    class Success < Base
      private

      def event_type
        'success'
      end
    end
  end
end
