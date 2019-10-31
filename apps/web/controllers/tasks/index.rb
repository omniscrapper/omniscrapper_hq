require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Tasks
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :tasks, :pagy_data

        def call(_)
          @pagy_data, @tasks = pagy TaskRepository.new
        end
      end
    end
  end
end
