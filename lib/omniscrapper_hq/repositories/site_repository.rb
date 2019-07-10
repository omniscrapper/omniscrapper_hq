class SiteRepository < Hanami::Repository
  associations do
    has_many :site_task_relationships
    has_many :scraping_tasks, through: :site_task_relationships
  end

  def find_with_scraping_tasks(id)
    aggregate(:scraping_tasks).where(id: id).map_to(Site).one
  end
end
