require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Schemas
      class Index
        include Web::Action
        include Controllers::Shared::Pagination
        include Import[
          schema_repo: 'repositories.schema'
        ]

        expose :schemas, :pagination_data

        def call(_)
          @pagination_data, @schemas = pagy schema_repo
        end
      end
    end
  end
end
