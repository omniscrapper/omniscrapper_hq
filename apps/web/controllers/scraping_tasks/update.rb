module Web
  module Controllers
    module ScrapingTasks
      class Update
        include Web::Action

        expose :scraping_task

        params do
          required(:id).filled(:int?)
          required(:scraping_task).schema do
            required(:name).filled(:str?)
          end
        end

        def call(params)
          @scraping_task = ScrapingTaskRepository.new.find(params[:id])
          if params.valid?
            ScrapingTaskRepository.new.update(@scraping_task.id, params[:scraping_task])
            redirect_to routes.scraping_task_path(@scraping_task.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
