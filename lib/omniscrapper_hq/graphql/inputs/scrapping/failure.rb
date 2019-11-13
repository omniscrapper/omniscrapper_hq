module Graphql
  module Inputs
    module Scrapping
      class Failure < ::Graphql::Inputs::Base
        description ''

        argument :exception_class, String, '', required: true
        argument :message, String, '', required: true
        argument :trace, String, '', required: true
      end
    end
  end
end
