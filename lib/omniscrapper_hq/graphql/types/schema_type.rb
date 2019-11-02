require 'json'

module Graphql
  module Types
    class SchemaType < BaseType
      field :id, ID, null: false
      field :name, String, null: false
      field :definition, String, null: false

      def definition
        JSON.generate(object.definition)
      end
    end
  end
end
