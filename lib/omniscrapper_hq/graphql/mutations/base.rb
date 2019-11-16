module Graphql
  module Mutations
    # Base mutation class
    class Base < GraphQL::Schema::RelayClassicMutation
      object_class Types::BaseType
      #field_class Types::BaseField
      #input_object_class Inputs::BaseInputObject
    end
  end
end
