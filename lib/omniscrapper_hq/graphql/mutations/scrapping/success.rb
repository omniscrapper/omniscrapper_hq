require './lib/omniscrapper_hq/graphql/mutations/scrapping/finish'
require './lib/omniscrapper_hq/operations/scrapping/success'

module Graphql
  module Mutations
    module Scrapping
      # Mutation to record the result of successful scrapping
      class Success < Finish
        argument :attributes, ::Graphql::Inputs::Scrapping::Success, required: true

        private

        def operation_class
          ::Operations::Scrapping::Success
        end
      end
    end
  end
end
