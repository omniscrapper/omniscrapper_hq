module Graphql
  module Inputs
    class Base < GraphQL::Schema::InputObject
      argument :task_id, ID, '', required: true
      argument :job_id, ID, '', required: true
      argument :url, String, '', required: true
    end
  end
end
