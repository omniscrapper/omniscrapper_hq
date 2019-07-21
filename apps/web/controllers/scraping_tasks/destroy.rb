module Web
  module Controllers
    module ScrapingTasks
      class Destroy
        include Web::Action

        def call(params)
          ScrapingTaskRepository.new.delete(params[:id])

          redirect_to routes.scraping_tasks_path
        end
      end
    end
  end
end
