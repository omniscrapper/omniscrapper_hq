module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        include Import[
          task_repo: 'repositories.scrapping.start_event'
        ]

        expose :tasks

        def call(params)
          @tasks = task_repo.tasks_statuses
        end
      end
    end
  end
end
