module Web
  module Controllers
    module TestResults
      class Index
        include Web::Action
        include Import[
          test_result_repo: 'repositories.test_result'
        ]

        expose :test_results

        def call(params)
          @test_results = test_result_repo.all
        end
      end
    end
  end
end
