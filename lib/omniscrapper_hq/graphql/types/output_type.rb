require 'json'

module Graphql
  module Types
    class OutputType < BaseType
      field :id, ID, null: false
      field :adapter, String, null: false
      field :adapter_params, String, null: false

      def adapter_params
        JSON.generate(object.adapter_params)
      end
    end
  end
end
