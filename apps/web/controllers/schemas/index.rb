require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Schemas
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :schemas, :pagy_data

        def call(_)
          @pagy_data, @schemas = pagy SchemaRepository.new
        end
      end
    end
  end
end
