require_relative '../mutations'

module Graphql
  module Types
    class MutationType < BaseType
      field :started_scrapping, mutation: Graphql::Mutations::Scrapping::Start
      field :successful_scrapping, mutation: Graphql::Mutations::Scrapping::Success
      field :failed_scrapping, mutation: Graphql::Mutations::Scrapping::Failure
      field :job_event, mutation: Graphql::Mutations::JobEvent::Create
    end
  end
end
