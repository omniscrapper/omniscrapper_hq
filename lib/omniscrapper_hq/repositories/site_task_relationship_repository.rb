class SiteTaskRelationshipRepository < Hanami::Repository
  associations do
    belongs_to :site
    belongs_to :scraping_tasks
  end
end
