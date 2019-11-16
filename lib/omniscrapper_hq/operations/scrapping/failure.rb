require './lib/omniscrapper_hq/operations/scrapping/base'

module Operations
  module Scrapping
    # Creates a failed scrapping result record
    class Failure < Base
      private

      def event_type
        'failure'
      end
    end
  end
end
