module Web
  module Controllers
    module Outputs
      class Update
        include Web::Action
        include Dry::Monads::Result::Mixin
        include Import[
          update_output: 'operations.output.update'
        ]

        expose :output

        def call(params)
          result = update_output.call(params.to_h)

          case result
          when Success
            flash[:success] = 'Output was successfully updated.'
            redirect_to routes.outputs_path
          when Failure
            flash[:error] = 'There was an error during output update.'
            @output = result.failure
          end
        end
      end
    end
  end
end
