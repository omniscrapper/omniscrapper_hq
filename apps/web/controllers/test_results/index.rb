require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module TestResults
      class Index
        include Web::Action
        include Controllers::Shared::Pagination
        include Import[
          test_result_repo: 'repositories.test_result'
        ]

        expose :test_results, :pagination_data

        def call(_)
          @pagination_data, @test_results = pagy test_result_repo
        end
      end
    end
  end
end
