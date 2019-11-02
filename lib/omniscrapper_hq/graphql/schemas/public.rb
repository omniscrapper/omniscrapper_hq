module Graphql
  module Schemas
    class Public < ::GraphQL::Schema
      query Graphql::Types::RootType
    end
  end
end
