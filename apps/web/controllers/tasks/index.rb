require_relative '../shared/pagination.rb'

module Web
  module Controllers
    module Tasks
      class Index
        include Web::Action
        include Controllers::Shared::Pagination

        expose :tasks, :pagination_data

        def call(_)
          @pagination_data, @tasks = pagy TaskRepository.new
        end
      end
    end
  end
end
