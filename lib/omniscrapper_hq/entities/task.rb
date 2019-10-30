class Task < Hanami::Entity
  def name
    "Scrapping-#{site_id}-#{schema_id}"
  end
end
