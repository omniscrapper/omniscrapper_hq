# frozen_string_literal: true

module Web
  module Controllers
    module Schemas
      class Create
        include Web::Action

        expose :schema

        params do
          required(:schema).schema do
            required(:name).filled
            required(:definition).filled
          end
        end

        def call(params)
          if params.valid?
            @schema = SchemaRepository.new.create(params[:schema])

            redirect_to routes.schemas_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
