module Web
  module Controllers
    module Tasks
      class Create
        include Web::Action
        include Dry::Monads::Result::Mixin

        def call(params)
          result = Operations::Task::Create.new.call(params.to_hash)

          case result
          when Success
            flash[:success] = 'Task was successfully created.'
            redirect_to routes.tasks_path
          when Failure
            flash[:error] = 'There was an error during task creation.'
          end
        end
      end
    end
  end
end
