require './lib/omniscrapper_hq/operations/scrapping/finish'

module Operations
  module Scrapping
    # Creates a failed scrapping result record
    class Failure < Finish
      private

      def event_type
        'failure'
      end
    end
  end
end
