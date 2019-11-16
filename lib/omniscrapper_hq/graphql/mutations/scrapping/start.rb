require './lib/omniscrapper_hq/graphql/mutations/base'

module Graphql
  module Mutations
    module Scrapping
      # Base class for scrapping finished mutations
      class Start < Base
        argument :attributes, ::Graphql::Inputs::Scrapping::Start, required: true

        field :errors, [String], null: false

        def resolve(attributes:)
          # TODO: handle operation result and render errors
          ::Operations::Scrapping::Start.new.call(attributes)
          {errors: []}
        end
      end
    end
  end
end
