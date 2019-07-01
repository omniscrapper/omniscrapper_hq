class SiteRepository < Hanami::Repository
  associations do
    has_many :schemas
  end

  def create_with_schemas(data)
    assoc(:schemas).create(data)
  end

  def find_with_schemas(id)
    aggregate(:schemas).where(id: id).as(Site).one
  end
end
