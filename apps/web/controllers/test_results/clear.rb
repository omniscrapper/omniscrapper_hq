module Web
  module Controllers
    module TestResults
      class Clear
        include Web::Action
        include Import[
          clear_results: 'operations.single_run.clear'
        ]

        def call(_)
          clear_results.call
          flash[:success] = 'Test results table was cleared'
          redirect_to routes.test_results_path
        end
      end
    end
  end
end
