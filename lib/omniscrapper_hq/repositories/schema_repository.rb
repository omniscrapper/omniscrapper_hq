class SchemaRepository < Hanami::Repository
  associations do
    belongs_to :site
  end

  def find_with_site(id)
    aggregate(:site).where(id: id).map_to(Schema).one
  end
end
