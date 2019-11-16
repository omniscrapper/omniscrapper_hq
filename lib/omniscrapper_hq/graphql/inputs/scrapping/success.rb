module Graphql
  module Inputs
    module Scrapping
      class Success < ::Graphql::Inputs::Base
        description ''

        argument :checksum, String, '', required: true
      end
    end
  end
end
