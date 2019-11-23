module Web
  module Controllers
    module Outputs
      class Edit
        include Web::Action
        include Import[
          output_repo: 'repositories.output'
        ]

        expose :output

        def call(params)
          @output = output_repo.find(params[:id])
        end
      end
    end
  end
end
