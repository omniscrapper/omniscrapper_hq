class Task < Hanami::Entity
  def name
    "Scrapping-#{site_id}-#{schema_id}"
  end

  def crawler_params
    super
  end
end
