module Graphql
  module Inputs
    class JobEvent < GraphQL::Schema::InputObject
      description 'Job event arguments'

      argument :job_id, ID, '', required: true
      argument :task_id, ID, '', required: true
      # TODO: event in this case should be an Enum
      argument :event, String, '', required: true
    end
  end
end
