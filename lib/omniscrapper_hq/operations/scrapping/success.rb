require './lib/omniscrapper_hq/operations/base'

module Operations
  module Scrapping
    # Creates a successful scrapping result record
    class Success < ::Operations::Base
      def call(attributes = {})
        puts "========= success #{attributes.to_h}"
      end
    end
  end
end
