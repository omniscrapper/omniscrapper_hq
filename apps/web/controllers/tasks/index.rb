require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Tasks
      class Index
        include Web::Action
        include Controllers::Shared::Pagination
        include Import[
          task_repo: 'repositories.task'
        ]

        expose :tasks, :pagination_data

        def call(_)
          @pagination_data, @tasks = pagy task_repo
        end
      end
    end
  end
end
