require './lib/omniscrapper_hq/graphql/mutations/base'
require './lib/omniscrapper_hq/operations/scrapping/success'

module Graphql
  module Mutations
    module Scrapping
      # Mutation to record the result of successful scrapping
      class Success < Base
        argument :attributes, ::Graphql::Inputs::Scrapping::Success, required: true

        field :errors, [String], null: false

        def resolve(attributes:)
          Operations::Scrapping::Success.new.call(attributes)
        end
      end
    end
  end
end
