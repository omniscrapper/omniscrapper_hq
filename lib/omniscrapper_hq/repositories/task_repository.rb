require_relative './shared/pagination.rb'

class TaskRepository < Hanami::Repository
  include OmniscrapperHq::Repositories::Shared::Pagination

  associations do
    has_many :test_results
    belongs_to :schema
    belongs_to :site
    has_many :scrapping_finished_events
    has_many :scrapping_started_events
  end

  def delete_with_dependencies(id)
    delete_dependent_test_results(id)
    delete(id)
  end

  def delete_dependent_test_results(id)
    TestResultRepository.new.delete_related_to(task_id: id)
  end
end
