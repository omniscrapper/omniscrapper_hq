module Web
  module Controllers
    module ScrapingTasks
      class Create
        include Web::Action
        expose :scraping_task

        params Class.new(Web::Validations::Base) {
          validations do
            required(:scraping_task).schema do
              required(:name).filled(:str?)

              required(:scraping_schedule).schema do
                required(:time).filled(:time?)
                required(:interval).filled(:int?)
              end

              required(:schema).schema do
                required(:metadata).filled(:json?)
              end
            end
          end
        }

        def call(params)
          if params.valid?
            @scraping_task = ScrapingTaskCreator.call(params[:scraping_task])

            redirect_to routes.scraping_task_path(@scraping_task.id)
          else
            self.status = 422
          end
        end
      end
    end
  end
end
