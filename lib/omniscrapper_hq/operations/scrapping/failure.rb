require './lib/omniscrapper_hq/operations/base'

module Operations
  module Scrapping
    # Creates a failed scrapping result record
    class Failure < ::Operations::Base
      def call(attributes = {})
        puts "========= failure #{attributes.to_h}"
      end
    end
  end
end
