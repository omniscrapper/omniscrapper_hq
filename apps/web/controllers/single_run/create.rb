module Web
  module Controllers
    module SingleRun
      class Create
        include Web::Action

        def call(params)
          task = TaskRepository.new.find(params[:task_id])
          flash[:success] = "Single run for task #{task.name} was started."
          Workers::SingleRun.perform_async(task.id)
          redirect_to routes.tasks_path
        end
      end
    end
  end
end
