class SchemaRepository < Hanami::Repository
  associations do
    has_many :tasks
  end
end
