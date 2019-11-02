module Graphql
  module Types
    class RootType < BaseType
      description 'The query root of this schema'

      field :task, TaskType, null: false do
        description 'Find a task by id'
        argument :id, ID, required: true
      end

      def task(id:)
        TaskRepository.new.find(id)
      end

      # TODO: add a proper pagination here
      field :tasks, [TaskType], null: false
      def tasks
        TaskRepository.new.all
      end
    end
  end
end
