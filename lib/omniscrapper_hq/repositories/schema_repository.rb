class SchemaRepository < Hanami::Repository
  associations do
    has_many :scraping_tasks
  end
end
