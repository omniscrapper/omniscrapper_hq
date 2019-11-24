module Web
  module Controllers
    module Outputs
      class Index
        include Web::Action
        include Import[
          output_repo: 'repositories.output'
        ]

        expose :outputs

        def call(_)
          @outputs = output_repo.all
        end
      end
    end
  end
end
