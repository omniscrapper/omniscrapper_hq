require './lib/omniscrapper_hq/graphql/mutations/base'

module Graphql
  module Mutations
    module Scrapping
      # Base class for scrapping finished mutations
      class Finish < Base
        field :errors, [String], null: false

        def resolve(attributes:)
          # TODO: handle operation result and render errors
          operation_class.new.call(attributes)
          {errors: []}
        end

        private

        def operation_class
          raise NotImplementedError, 'implement #operation_class in child class'
        end
      end
    end
  end
end
