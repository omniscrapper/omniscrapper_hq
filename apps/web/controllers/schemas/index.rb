require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Schemas
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :schemas, :pagination_data

        def initialize(repository: SchemaRepository.new)
          @repository = repository
        end

        def call(_)
          @pagination_data, @schemas = pagy @repository
        end
      end
    end
  end
end
