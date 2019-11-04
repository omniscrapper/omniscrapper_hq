require_relative './shared/pagination.rb'

class SiteRepository < Hanami::Repository
  include OmniscrapperHq::Repositories::Shared::Pagination

  associations do
    has_many :tasks
  end

  def delete_with_dependencies(id)
    delete_dependent_tasks(id)
    delete(id)
  end

  def delete_dependent_tasks(id)
    TaskRepository.new.delete_related_to(site_id: id)
  end
end
