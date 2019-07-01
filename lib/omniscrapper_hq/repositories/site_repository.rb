class SiteRepository < Hanami::Repository
  associations do
    has_many :schemas
  end

  def create_with_schemas(data)
    assoc(:schemas).create(data)
  end

  def find_with_schemas(id)
    aggregate(:schemas).where(id: id).map_to(Site).one
  end

  def add_schema(site, data)
    assoc(:schemas, site).add(data)
  end
end
