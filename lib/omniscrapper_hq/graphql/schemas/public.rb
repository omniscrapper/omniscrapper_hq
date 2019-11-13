module Graphql
  module Schemas
    # Main schema
    class Public < ::GraphQL::Schema
      query Graphql::Types::RootType
      mutation Graphql::Types::MutationType
    end
  end
end
