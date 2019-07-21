module Web
  module Controllers
    module ScrapingTasks
      class Create
        include Web::Action
        expose :scraping_task

        def call(params)
          validator = ScrapingTaskCreateValidator.new(params.raw).validate
          if validator.success?
            @scraping_task = ScrapingTaskCreator.new(params[:scraping_task]).call

            redirect_to routes.scraping_task_path(@scraping_task.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
