require_relative './shared/pagination.rb'

class SchemaRepository < Hanami::Repository
  include OmniscrapperHq::Repositories::Shared::Pagination

  associations do
    has_many :tasks
  end
end
