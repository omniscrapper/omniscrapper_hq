module Graphql
  module Types
    class SiteType < BaseType
      field :id, ID, null: false
      field :name, String, null: false
      field :url, String, null: false
    end
  end
end
