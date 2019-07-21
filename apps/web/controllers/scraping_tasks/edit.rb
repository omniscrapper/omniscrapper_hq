module Web
  module Controllers
    module ScrapingTasks
      class Edit
        include Web::Action
        expose :scraping_task

        def call(params)
          @scraping_task = ScrapingTaskRepository.new.find(params[:id])
        end
      end
    end
  end
end
