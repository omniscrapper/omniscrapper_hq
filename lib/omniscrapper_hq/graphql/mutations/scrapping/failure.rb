require './lib/omniscrapper_hq/graphql/mutations/base'
require './lib/omniscrapper_hq/operations/scrapping/failure'

module Graphql
  module Mutations
    module Scrapping
      # Mutation to record the result of successful scrapping
      class Failure < Base
        argument :attributes, ::Graphql::Inputs::Scrapping::Failure, required: true

        field :errors, [String], null: false

        def resolve(attributes:)
          Operations::Scrapping::Failure.new.call(attributes)
          {errors: []}
        end
      end
    end
  end
end
