class ScrapingTaskRepository < Hanami::Repository
  associations do
    has_many :site_task_relationships
    has_many :sites, through: :site_task_relationships
    belongs_to :schema
    belongs_to :scraping_schedule
  end

  def find_with_schema(id)
    aggregate(:schema).where(id: id).map_to(ScrapingTask).one
  end

  def find_with_scraping_schedule(id)
    aggregate(:scraping_schedule).where(id: id).map_to(ScrapingTask).one
  end

  def find_with_everything(id)
    aggregate(:schema, :scraping_schedule).where(id: id).map_to(ScrapingTask).one
  end

  def find_with_sites(id)
    aggregate(:sites).where(id: id).map_to(ScrapingTask).one
  end
end
