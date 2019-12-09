require_relative '../shared/pagination'

module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        include Controllers::Shared::Pagination
        include Import[
          tasks_statistics: 'domain.statistics.tasks'
        ]

        expose :tasks, :pages, :pagination_data

        def call(params)
          @tasks = tasks_statistics.call
          @pagination_data, @pages = pagy(Scrapping::FinishEventRepository.new)
        end
      end
    end
  end
end
