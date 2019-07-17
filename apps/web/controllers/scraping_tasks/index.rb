module Web
  module Controllers
    module ScrapingTasks
      class Index
        include Web::Action
        expose :scraping_tasks

        def call(_params)
          @scraping_tasks = ScrapingTaskRepository.new.all
        end
      end
    end
  end
end
