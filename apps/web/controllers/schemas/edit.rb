module Web
  module Controllers
    module Schemas
      class Edit
        include Web::Action
        include Import[
          schema_repo: 'repositories.schema'
        ]

        expose :schema

        def call(params)
          @schema = schema_repo.find(params[:id])
        end
      end
    end
  end
end
