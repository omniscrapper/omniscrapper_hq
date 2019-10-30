class TaskRepository < Hanami::Repository
  associations do
    belongs_to :schema
    belongs_to :site
  end
end
