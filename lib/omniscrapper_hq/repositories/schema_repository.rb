require_relative './shared/pagination.rb'

class SchemaRepository < Hanami::Repository
  include OmniscrapperHq::Repositories::Shared::Pagination

  associations do
    has_many :tasks
  end

  def by_id(schema_id)
    schemas.where(id: schema_id).first
  end
end
