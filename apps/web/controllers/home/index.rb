module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        include Import[
          tasks_statistics: 'domain.statistics.tasks'
        ]

        expose :tasks

        def call(params)
          @tasks = tasks_statistics.call
        end
      end
    end
  end
end
