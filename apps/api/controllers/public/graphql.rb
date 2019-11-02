require './lib/omniscrapper_hq/graphql'

module Api
  module Controllers
    module Public
      class Graphql
        include Api::Action
        accept :json

        params do
          required(:query).filled
          optional(:variables).filled
        end

        def call(params)
          result = ::Graphql::Schemas::Public.execute(params[:query], variables: params[:variables])
          self.body = JSON.generate(result)
        end
      end
    end
  end
end
