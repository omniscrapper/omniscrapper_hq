class SchemaRepository < Hanami::Repository
  associations do
    has_many :scraping_tasks
  end

  def find_with_scraping_tasks(id)
    aggregate(:scraping_tasks).where(id: id).map_to(Schema).one
  end

  def add_scraping_task(scraping_task, data)
    assoc(:scraping_tasks, scraping_task).add(data)
  end
end
