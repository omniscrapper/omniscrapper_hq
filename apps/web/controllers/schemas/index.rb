module Web
  module Controllers
    module Schemas
      class Index
        include Web::Action

        expose :schemas

        def call(_params)
          @schemas = SchemaRepository.new.all
        end
      end
    end
  end
end
