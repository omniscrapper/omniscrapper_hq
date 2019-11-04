class TestResultRepository < Hanami::Repository
  include OmniscrapperHq::Repositories::Shared::Pagination

  def delete_related_to(options)
    root.where(options).delete
  end
end
