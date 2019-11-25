module Web
  module Controllers
    module Schemas
      class Update
        include Web::Action
        include Import[
          schema_repo: 'repositories.schema'
        ]

        expose :schema

        params do
          required(:schema).schema do
            required(:name).filled
            required(:definition).filled
          end
        end

        # TODO:
        # create operation
        # filter params
        # validate params
        # validate schema
        def call(params)
          @schema = schema_repo.find(params[:id])
          schema_repo.update(params[:id], params[:schema])
          flash[:success] = 'Schema was updated.'
          redirect_to routes.schemas_path
          #else
            #flash[:error] = 'There was an error during output update.'
          #end
        end
      end
    end
  end
end
