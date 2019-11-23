require_relative './shared/pagination.rb'

class SiteRepository < Hanami::Repository
  include OmniscrapperHq::Repositories::Shared::Pagination

  associations do
    has_many :tasks
  end

  def find_with_tasks(id)
    aggregate(:tasks).where(id: id).map_to(Site).one
  end

  def find_by(options = {})
    sites
      .where(options)
      .first
  end
end
