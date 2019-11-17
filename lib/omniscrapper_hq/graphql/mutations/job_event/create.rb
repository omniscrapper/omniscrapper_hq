require './lib/omniscrapper_hq/graphql/mutations/base'

module Graphql
  module Mutations
    module JobEvent
      class Create < Base
        argument :attributes, ::Graphql::Inputs::JobEvent, required: true
        field :errors, [String], null: false

        def resolve(attributes:)
          # TODO: handle operation result and render errors
          JobEventRepository.new.create(attributes)
          {errors: []}
        end
      end
    end
  end
end
