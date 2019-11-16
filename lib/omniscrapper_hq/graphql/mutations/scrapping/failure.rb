require './lib/omniscrapper_hq/graphql/mutations/scrapping/finish'
require './lib/omniscrapper_hq/operations/scrapping/failure'

module Graphql
  module Mutations
    module Scrapping
      # Mutation to record the result of successful scrapping
      class Failure < Finish
        argument :attributes, ::Graphql::Inputs::Scrapping::Failure, required: true

        private

        def operation_class
          ::Operations::Scrapping::Failure
        end
      end
    end
  end
end
