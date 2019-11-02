require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Schemas
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :schemas, :pagination_data

        def call(_)
          @pagination_data, @schemas = pagy SchemaRepository.new
        end
      end
    end
  end
end
