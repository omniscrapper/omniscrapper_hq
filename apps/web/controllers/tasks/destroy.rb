module Web
  module Controllers
    module Tasks
      class Destroy
        include Web::Action

        def call(params)
          task = repo.find(params[:id])
          repo.delete(task.id)

          redirect_to routes.tasks_path
        end

        private

        def repo
          @repo ||= TaskRepository.new
        end
      end
    end
  end
end
