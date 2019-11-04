module Web
  module Controllers
    module Outputs
      class Create
        include Web::Action
        include Import[
          create_output: 'operations.output.create'
        ]

        def call(params)
          create_output.call(params[:output])
          flash[:success] = 'Output was successfully created'
          redirect_to routes.outputs_path
        end
      end
    end
  end
end
